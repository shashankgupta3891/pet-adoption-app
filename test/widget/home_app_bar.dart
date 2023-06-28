import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_adoption_app/presentation/widget/home/app_bar.dart';

void main() {
  testWidgets('HomeAppBar displays correctly', (WidgetTester tester) async {
    // Build the HomeAppBar widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              HomeAppBar(),
            ],
          ),
        ),
      ),
    );

    // Verify that the AppBar contains the expected widgets

    // Verify the IconButton
    final iconButtonFinder = find.byIcon(FontAwesomeIcons.bars);
    expect(iconButtonFinder, findsOneWidget);

    // Verify the location text
    final locationTextFinder = find.text('Location');
    expect(locationTextFinder, findsOneWidget);
    final locationTextWidget = tester.widget<Text>(locationTextFinder);
    expect(
        locationTextWidget.style?.color,
        Theme.of(tester.element(locationTextFinder))
            .primaryColor
            .withOpacity(0.4));

    // Verify the location information
    final locationIconFinder = find.byIcon(FontAwesomeIcons.locationDot);
    expect(locationIconFinder, findsOneWidget);
    final locationIconWidget = tester.widget<Icon>(locationIconFinder);
    expect(locationIconWidget.color,
        Theme.of(tester.element(locationIconFinder)).primaryColor);

    final shahdaraTextFinder = find.text('Shahdara, ');
    expect(shahdaraTextFinder, findsOneWidget);
    final shahdaraTextWidget = tester.widget<Text>(shahdaraTextFinder);
    expect(shahdaraTextWidget.style?.fontSize, 22.0);
    expect(shahdaraTextWidget.style?.fontWeight, FontWeight.w600);

    final delhiTextFinder = find.text('Delhi');
    expect(delhiTextFinder, findsOneWidget);
    final delhiTextWidget = tester.widget<Text>(delhiTextFinder);
    expect(delhiTextWidget.style?.fontSize, 22.0);
    expect(delhiTextWidget.style?.fontWeight, FontWeight.w300);

    // Verify the CircleAvatar
    final circleAvatarFinder = find.byType(CircleAvatar);
    expect(circleAvatarFinder, findsOneWidget);
    final circleAvatarWidget = tester.widget<CircleAvatar>(circleAvatarFinder);
    expect(circleAvatarWidget.radius, 20.0);
  });
}
