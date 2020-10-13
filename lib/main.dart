import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_archi/provider_setup.dart';
import 'package:provider_archi/ui/router.dart';

import 'core/constants/app_contstants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
          providers: providers,
          child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutePaths.Login,
        onGenerateRoute: RouterCustom.generateRoute,
      ),
    );
  }
}