import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_stu/generated/l10n.dart';
import 'package:test_stu/states/LocalModel.dart';

class LanguageRoute extends StatefulWidget {
  const LanguageRoute({Key? key}) : super(key: key);

  @override
  _LanguageRouteState createState() => _LanguageRouteState();
}

class _LanguageRouteState extends State<LanguageRoute> {
  @override
  Widget build(BuildContext context) {
    var localModel = Provider.of<LocalModel>(context);
    Color color = Theme.of(context).primaryColor;

    Widget _buildLanguageItem(String name, String? locale) {
      return ListTile(
        title: Text(name,
            style:
                TextStyle(color: localModel.locale == locale ? color : null)),
        trailing:
            Icon(Icons.done, color: localModel.locale == locale ? color : null),
        onTap: (){
          localModel.locale = locale;
          Navigator.pop(context);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).language)),
      body: ListView(
        children: [
          _buildLanguageItem('简体中文', 'zh_CN'),
          _buildLanguageItem('英语', 'en_US'),
          _buildLanguageItem(S.of(context).auto, null)

        ],
      ),
    );
  }
}
