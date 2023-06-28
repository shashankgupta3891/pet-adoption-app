import 'package:flutter/material.dart';
import 'package:pet_adoption_app/core/const/media_const.dart';
import 'package:pet_adoption_app/presentation/pages/history_page.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Shashank gupta"),
            accountEmail: const Text("shashankgupta3891@gmail.com"),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.7),
            ),
            currentAccountPictureSize: const Size.square(72.0),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage(ImageConst.profile),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: const Text("History"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HistoryPage(),
                      ),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
