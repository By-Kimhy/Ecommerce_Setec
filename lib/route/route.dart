import 'package:ecommercesetec/views/home/home_page.dart';
import 'package:ecommercesetec/views/login_page/login_page.dart';
import 'package:ecommercesetec/views/login_page/login_page1.dart';
import 'package:ecommercesetec/views/main_page/main_page.dart';
import 'package:ecommercesetec/views/product_detail/product_detail.dart';
import 'package:ecommercesetec/views/splash_page/splash_page.dart';

var route={
  SplashPage().routeName:(context)=>SplashPage(),
  HomePage().routeName:(context)=>HomePage(),
  MainPage().routeName:(context)=>MainPage(),
  ProductDetail().routeName:(context)=>ProductDetail(),
  LoginPage().routeName:(context)=>LoginPage(),
  LoginPage1().routeName:(context)=>LoginPage1(),
};