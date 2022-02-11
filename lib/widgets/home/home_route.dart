import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_stu/generated/l10n.dart';
import 'package:test_stu/states/UserModel.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(S.of(context).home)), body: _buildBody(),);
  }


  Widget _buildBody(){
    UserModel userModel = Provider.of<UserModel>(context);
    if(!userModel.isLogin){
      return Center(child: ElevatedButton(child: Text(S.of(context).login), onPressed: (){
        Navigator.of(context).pushNamed('login');
      }),);
    }else{
      return Center();
    }
  }



}
