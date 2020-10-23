import 'package:centro_edu_unificado/provider/users_provider.dart';
import 'package:centro_edu_unificado/routes/app_routes.dart';
import 'package:centro_edu_unificado/view/home.dart';
import 'package:centro_edu_unificado/view/user_form.dart';
import 'package:centro_edu_unificado/view/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
      ChangeNotifierProvider(
        create: (ctx) => Users(),
    ),
  ],
      child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
        routes: {
        AppRoutes.HOME: (_) => Home(),
        AppRoutes.USER_FORM: (_) => UserForm()
        },
      ),
    );
  }
}

