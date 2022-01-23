import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:kafey/Helpers/hivr_helper.dart';
import 'package:kafey/UI/Main/cubit/main_cubit.dart';
import 'package:kafey/UI/User/login/login_screen.dart';
import 'package:kafey/generated/l10n.dart';


class CustomDrawer extends StatelessWidget {
  final MainCubit cubit;

  CustomDrawer(this.cubit);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text("User Email",style: TextStyle(color: Colors.black),),
            accountName: Text("User Name",style: TextStyle(color: Colors.black),),
            currentAccountPicture: GestureDetector(
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://avatars3.githubusercontent.com/u/16825392?s=460&v=4"),
              ),
              onTap: () => print("This is your current account."),
            ),
            decoration: const BoxDecoration(
                color: Colors.white),
          ),
          // ListTile(
          //     title: Text(S.of(context).chat),
          //     trailing: Icon(Localizations.localeOf(context).toString() == 'ar'
          //         ? CupertinoIcons.chevron_left
          //         : CupertinoIcons.chevron_right),
          //     onTap: () {
          //       Navigator.of(context).pop();
          //       // Navigator.of(context).push(  MaterialPageRoute(builder: (BuildContext context) =>   Page("First Page")));
          //     }),
           ListTile(
            title: Text(S.of(context).setting),
            trailing: Icon(Localizations.localeOf(context).toString() == 'ar'
                ? CupertinoIcons.chevron_left
                : CupertinoIcons.chevron_right),
            onTap: () {
              Navigator.pop(context);
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (BuildContext context) => LanguagesScreen()));
            },
          ),
          const Divider(),
          ListTile(
            title: Text(S.of(context).logout),
            trailing: Icon(Localizations.localeOf(context).toString() == 'ar'
                ? CupertinoIcons.chevron_left
                : CupertinoIcons.chevron_right),
            onTap: () {
              Hive.box(HiveHelper.KEY_BOX_TOKEN).clear();
              Navigator.pop(context);
              Get.offAll(LoginScreen());
              // cubit.removeFirebaseDeviceToken();
            },
          ),
        ],
      ),
    );
  }
}
