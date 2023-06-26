import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        InkWell(
          child: const Icon(
            FontAwesomeIcons.bars,
          ),
          onTap: () {},
        ),
        Column(
          children: <Widget>[
            Text(
              'Location',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18.0,
                color: Theme.of(context).primaryColor.withOpacity(0.4),
              ),
            ),
            Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.locationDot,
                  color: Theme.of(context).primaryColor,
                ),
                const Text(
                  'Shahdara, ',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22.0,
                  ),
                ),
                const Text(
                  'Delhi',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 22.0,
                  ),
                ),
              ],
            ),
          ],
        ),
        const CircleAvatar(
          radius: 20.0,
          backgroundImage: AssetImage('assets/images/sola.png'),
        ),
      ],
    );
  }
}
