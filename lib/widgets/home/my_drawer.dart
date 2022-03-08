import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_stu/common/global_widget.dart';
import 'package:test_stu/generated/l10n.dart';
import 'package:test_stu/states/UserModel.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_buildHeader(),
              Expanded(child: _buildMenus())],
            )));
  }

  Widget _buildHeader() {
    return Consumer<UserModel>(builder: (context, userModel, child) {
      return GestureDetector(
        child: Container(
          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.only(top: 40, bottom: 20),
          child: Row(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ClipOval(
                      child: userModel.isLogin
                          ? gmAvatar(userModel.user!.avatar_url, width: 80)
                          : Container(
                              width: 80,
                              height: 80,
                              padding: const EdgeInsets.all(16),
                              color: Colors.white,
                              child: Image.asset(
                                'images/ic_launcher.png',
                              )))),
              Text(
                userModel.isLogin ? userModel.user!.login : S.of(context).login,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _buildMenus() {
    return Consumer<UserModel>(builder: (context, userModel, child) {
      return ListView(
        children: [
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text(S.of(context).theme),
            onTap: () => Navigator.of(context).pushNamed('themes'),
          ),
          ListTile(
              leading: const Icon(Icons.language),
              title: Text(S.of(context).language),
              onTap: () => Navigator.of(context).pushNamed('language')),
          if(userModel.isLogin)
            ListTile(
              leading: const Icon(Icons.power_settings_new),
              title: Text(S.of(context).logout),
              onTap: (){
                showDialog(context: context, builder: (ctx){
                  return AlertDialog(title: Text(S.of(ctx).tips),
                    content: Text(S.of(ctx).logout_tips),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                      } , child: Text(S.of(ctx).cancel)),
                      TextButton(onPressed: (){
                        userModel.user = null;
                        Navigator.pop(context);
                      } , child: Text(S.of(ctx).confirm)),

                    ],
                  );
                });
              },
            )

        ],
      );
    });
  }
}
