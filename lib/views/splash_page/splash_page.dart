import 'package:ecommercesetec/views/main_page/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget{
  String routeName='/splash_page';
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),(){
      //pushNamed use for go to main but can go back the splash_page
      //Navigator.pushNamed(context, MainPage().routeName);
      Navigator.pushReplacementNamed(context, MainPage().routeName);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSamg4bNyexsMkfnWSclLMTIYbnWiCwT8IhkQ&s"),),
    );
  }
}