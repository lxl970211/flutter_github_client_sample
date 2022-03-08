import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_stu/common/Global.dart';
import 'package:test_stu/generated/l10n.dart';
import 'package:test_stu/states/ThemeModel.dart';

class MyThemes extends StatefulWidget {
  const MyThemes({Key? key}) : super(key: key);

  @override
  _MyThemesState createState() => _MyThemesState();
}

class _MyThemesState extends State<MyThemes> {
  @override
  Widget build(BuildContext context) {

    var themeModel = Provider.of<ThemeModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).theme)),
      body: ListView(
        children: Global.themes.map<Widget>((e) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                color: e,
                height: 40,
              ),
            ),
            onTap: (){
              themeModel.theme = e;
            },
          );
        }).toList(),
      ),
    );
  }
}
