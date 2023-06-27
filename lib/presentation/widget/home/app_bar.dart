import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_peeps/open_peeps.dart';

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
        IconButton(
          icon: const Icon(
            FontAwesomeIcons.bars,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
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
        CircleAvatar(
          radius: 20.0,
          // backgroundImage: AssetImage(ImageConst.transparentCat),
          child: PeepAvatar.fromPeep(
            size: 50,
            peep: PeepGenerator().generate(),
          ),
        ),
      ],
    );
  }
}
