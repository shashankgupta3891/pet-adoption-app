import 'package:flutter/material.dart';
import 'package:pet_adoption_app/domain/entities/pet_type.dart';

class PetTypeItem extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onClick;
  final PetType type;

  const PetTypeItem({
    super.key,
    required this.isSelected,
    required this.onClick,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color:
                    isSelected ? Theme.of(context).primaryColor : Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 3),
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.black.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 10,
                  )
                ],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  type.iconData,
                  size: 25.0,
                  color: isSelected
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Text(
              type.displayName,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
