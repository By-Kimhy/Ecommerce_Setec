import 'package:ecommercesetec/route/route.dart';
import 'package:ecommercesetec/views/splash_page/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(app);
}

class Ecommerce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashPage().routeName,
      routes: route,
    );

  }
}