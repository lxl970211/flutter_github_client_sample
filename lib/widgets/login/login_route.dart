import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_stu/common/Git.dart';
import 'package:test_stu/generated/l10n.dart';
import 'package:test_stu/models/user.dart';
import 'package:test_stu/states/UserModel.dart';

class LoginRoute extends StatefulWidget {
  const LoginRoute({Key? key}) : super(key: key);

  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  @override
  Widget build(BuildContext context) {
    var s = Provider.of<UserModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).login)),
      body: Center(
        child: ElevatedButton(child: Text(S.of(context).login_tips), onPressed: () async{
          User user = await Git(context).login('lxl970211', '');
          s.user = user;
          Navigator.pop(context);
        },),
      ),
    );
  }
}
