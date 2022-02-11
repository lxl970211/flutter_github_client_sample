import 'package:flutter/material.dart';
import 'package:test_stu/generated/l10n.dart';

class LoginRoute extends StatefulWidget {
  const LoginRoute({Key? key}) : super(key: key);

  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).login)),
      body: Center(
        child: Text(S.of(context).login_tips),
      ),
    );
  }
}
