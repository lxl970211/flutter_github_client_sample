import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:test_stu/generated/l10n.dart';
import 'package:test_stu/states/LocalModel.dart';
import 'package:test_stu/states/ThemeModel.dart';
import 'package:test_stu/states/UserModel.dart';
import 'package:test_stu/widgets/home/home_route.dart';
import 'package:test_stu/widgets/language/language.dart';
import 'package:test_stu/widgets/login/login_route.dart';
import 'package:test_stu/widgets/themes/theme.dart';




class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider.value(value: ThemeModel()),
      ChangeNotifierProvider.value(value: LocalModel()),
      ChangeNotifierProvider.value(value: UserModel()),
    ],
    child: Consumer2<ThemeModel, LocalModel>(builder: (context, themeModel, localModel, child){
      return MaterialApp(
        theme: ThemeData(primarySwatch: themeModel.theme),
        locale: localModel.getLocale(),
        onGenerateTitle: (context){
          return S.of(context).title;
        },
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        routes: <String, WidgetBuilder>{
          'login' : (context) => LoginRoute(),
          'themes' : (context) => MyThemes(),
          'language' : (context) => LanguageRoute()

        },
        home: HomeRoute(),
      );

    }),
    );
  }
}

