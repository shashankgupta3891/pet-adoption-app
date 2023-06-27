import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_adoption_app/domain/entities/pet_type.dart';
import 'package:pet_adoption_app/presentation/widget/home/pet_type_item.dart';

void main() {
  testWidgets('PetTypeItem displays correctly when selected',
      (WidgetTester tester) async {
    // Build the PetTypeItem widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PetTypeItem(
            isSelected: true,
            onClick: () {},
            type: PetType.cat,
          ),
        ),
      ),
    );

    // Verify that the icon color is white when selected
    final iconFinder = find.byIcon(Icons.pets);
    expect(iconFinder, findsOneWidget);
    final iconWidget = tester.widget<Icon>(iconFinder);
    expect(iconWidget.color, Colors.white);

    // Verify that the text color is the primary color when selected
    final textFinder = find.text('Dog');
    expect(textFinder, findsOneWidget);
    final textWidget = tester.widget<Text>(textFinder);
    expect(textWidget.style?.color,
        Theme.of(tester.element(iconFinder)).primaryColor);
  });

  testWidgets('PetTypeItem displays correctly when not selected',
      (WidgetTester tester) async {
    // Build the PetTypeItem widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PetTypeItem(
            isSelected: false,
            onClick: () {},
            type: PetType.cat,
          ),
        ),
      ),
    );

    // Verify that the icon color is the primary color when not selected
    final iconFinder = find.byIcon(Icons.pets);
    expect(iconFinder, findsOneWidget);
    final iconWidget = tester.widget<Icon>(iconFinder);
    expect(iconWidget.color, Theme.of(tester.element(iconFinder)).primaryColor);

    // Verify that the text color is the primary color when not selected
    final textFinder = find.text('Dog');
    expect(textFinder, findsOneWidget);
    final textWidget = tester.widget<Text>(textFinder);
    expect(textWidget.style?.color,
        Theme.of(tester.element(iconFinder)).primaryColor);
  });
}
