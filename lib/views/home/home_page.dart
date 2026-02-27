import 'dart:convert';

import 'package:ecommercesetec/model/product_model.dart';
import 'package:ecommercesetec/services/product_service.dart';
import 'package:ecommercesetec/views/login_page/login_page.dart';
import 'package:ecommercesetec/views/login_page/login_page1.dart';
import 'package:ecommercesetec/views/product_detail/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  String routeName = '/home';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductService _productService=ProductService();
  List<Product> listProduct=[];
  @override
  void initState() {

    super.initState();
    fetchProductData();
  }

  Future<void> fetchProductData() async {
    listProduct= await _productService.fetchProduct();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildBanner(context),
          _buildTitle("Shop by Categories"),
          _buildListCategory(),
          _buildTitle("Special Offers"),
          _buildListProduct(context,listProduct),
          _buildTitle("New Product"),
          _buildListProduct(context,listProduct),
        ],
      )

    );
  }
}

_buildBanner(BuildContext context){
  return InkWell(
    onTap: ()=>Navigator.of(context).pushNamed(LoginPage1().routeName),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10)
      ),
      height: 250,
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      clipBehavior: Clip.hardEdge,
      child: Image.network(
          fit: BoxFit.cover,
          "https://www.apacoutlookmag.com/media/chip-mong-retail-1-1597331139.profileImage.2x-jpg-webp.webp"),
    ),
  );
}

_buildTitle(String title){
  return Container(
    margin: EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold),),
        Text("See All",
          style: TextStyle(
            fontSize: 18),),
      ],
    ),
  );
}


var listCategorys=[
  {
    "image":"https://www.recipetineats.com/tachyon/2023/05/Garlic-cheese-pizza_9.jpg",
    "title":"Pizza"
  },
  {
    "image":"https://d1hm90tax3m3th.cloudfront.net/web/vegetables.jpg",
    "title":"Vegetable"
  },
  {
    "image":"https://www.recipetineats.com/tachyon/2023/05/Garlic-cheese-pizza_9.jpg",
    "title":"Pizza"
  },
  {
    "image":"https://d1hm90tax3m3th.cloudfront.net/web/vegetables.jpg",
    "title":"Vegetable"
  },
  {
    "image":"https://www.recipetineats.com/tachyon/2023/05/Garlic-cheese-pizza_9.jpg",
    "title":"Pizza"
  },
  {
    "image":"https://d1hm90tax3m3th.cloudfront.net/web/vegetables.jpg",
    "title":"Vegetable"
  },
];

_buildListCategory(){
  return Container(
    height: 120,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: listCategorys.length,
      itemBuilder: (context,index){
        return Container(
          margin: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10
          ),
          child: Column(
            children: [
              Container(
                  height: 80,
                  width: 80,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.network(
                      "${listCategorys[index]["image"]}",
                    fit: BoxFit.cover,)
              ),
              SizedBox(
                height: 10,
              ),
              Text("${listCategorys[index]["title"]}"),

            ],
          ),
        );
      }
    ),
  );
}

_buildListProduct(BuildContext context,List<Product> list){
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    padding: EdgeInsets.only(bottom: 10),
    height: 180,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context,index){
          return _buildProductItem(context,list[index]);
        }
    ),
  );
}

// _buildProductItem(BuildContext context,var product){
//   return InkWell(
//     onTap: (){
//       Navigator.pushNamed(context, ProductDetail().routeName);
//     },
//     child: Container(
//       margin: EdgeInsets.only(left: 10, right: 5),
//       width: 160,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 8,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.vertical(
//                   top: Radius.circular(12),
//                 ),
//                 child: Image.network(
//                   product["image"] as String,
//                   height: 120,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Positioned(
//                 right: 8,
//                 top: 8,
//                 child: Icon(Icons.favorite_border),
//               ),
//             ],
//           ),
//
//           SizedBox(height: 6),
//
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 8),
//             child: Text(
//               product["title"] as String,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//             ),
//           ),
//
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//             child: Text(
//               "\$${product["price"]}",
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.green,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     )
//   );
// }

_buildProductItem(BuildContext context,Product product){
  return InkWell(
    onTap: (){
      Navigator.pushNamed(
          context,
          ProductDetail().routeName,
            arguments: {"id":"${product.id}"});
    },
    child: Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 5,
      ),
      width: 125,
      // clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.black12,
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(2,4)
            ),
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            child: Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.network(
                      "${product.image}",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Icon(Icons.favorite_border,color: Colors.red,),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(
                width: 8,
              ),
              Icon(Icons.star_border_outlined,size: 15,),
              Icon(Icons.star_border_outlined,size: 15,),
              Icon(Icons.star_border_outlined,size: 15,),
              Icon(Icons.star_border_outlined,size: 15,),
              Icon(Icons.star_border_outlined,size: 15,),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              maxLines: 1,
              "${product.title}",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 8,
              ),
              Text("\$ ${product.price}",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Icon(Icons.add_shopping_cart),
              SizedBox(
                width: 8,
              )
            ],
          ),
        ],
      ),
    ),
  );
}