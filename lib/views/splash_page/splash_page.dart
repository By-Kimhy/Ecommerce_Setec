import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget{
  String routeName='/splash_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSamg4bNyexsMkfnWSclLMTIYbnWiCwT8IhkQ&s"),),
    );
  }

}