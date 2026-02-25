import 'dart:convert';
import 'dart:math';

import 'package:ecommercesetec/model/product_model.dart';
import 'package:ecommercesetec/services/product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget{
  String routeName="detail";
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final _productService = ProductService();
  int? id;
  Product? productData;

  @override
  void didChangeDependencies() {
    var data=ModalRoute.of(context)?.settings.arguments as Map;
    id = int.parse(data["id"]);
    print("ID ----$id");
    fetchProductByID(id!);
    super.didChangeDependencies();
  }

  Future<void> fetchProductByID(int id) async {
    productData=await _productService.fetchProductByID(id);
    log("Data-Detail--${jsonEncode(productData)}" as num);
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //
  //   final args = ModalRoute.of(context)?.settings.arguments;
  //
  //   if (args != null && args is Map<String, dynamic>) {
  //     id = int.parse(args["id"].toString());
  //     print("ID ---- $id");
  //   } else {
  //     print("No arguments received");
  //   }
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Detail'),
        actions: [
          Stack(
            children: [
              Icon(Icons.shopping_cart,size: 28,),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text('2',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: ListView(
        children: [
          _buildBanner(),
          _buildTitleDetail(),
          _buildTitle("Related Products"),
          //_buildListProduct(context),

        ],
      ),
    );
  }
}

_buildBanner(){
  return Container(
    height: 350,
    child: Image.network(
        fit: BoxFit.cover,
        "https://www.apacoutlookmag.com/media/chip-mong-retail-1-1597331139.profileImage.2x-jpg-webp.webp"),
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

_buildTitleDetail(){
  return Container(
    margin: EdgeInsets.only(
      left: 12,
      right: 12,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text("Mango Juice",style: TextStyle(fontSize: 24),),
            Spacer(),
            Icon(Icons.favorite_border),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Icon(Icons.star_border,size: 20,),
            Icon(Icons.star_border,size: 20,),
            Icon(Icons.star_border,size: 20,),
            Icon(Icons.star_border,size: 20,),
            Icon(Icons.star_border,size: 20,),
            SizedBox(
              width: 5,
            ),
            Text("(4.6)",style:TextStyle(fontSize: 20),),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text("\$ 3.50",style: TextStyle(fontSize: 24,color: Colors.green,fontWeight: FontWeight.bold),),
            Spacer(),
            _buildButton("Add To Cart",txtColor: Colors.green),
            SizedBox(
              width: 10,
            ),
            _buildButton("Buy Now",bgColor: Colors.green,txtColor: Colors.white),
            SizedBox(
              width: 10,
            )
          ],
        ),
        Divider(
          color: Colors.black.withAlpha(80),
          height: 30,
        ),
        Text("Description",style: TextStyle(fontWeight: .bold,fontSize: 25),),
        Text(textAlign: TextAlign.justify,
          """Effortlessly Split Panes and Navigate Between Code With the new Tab Multi-Select functionality, tabs become first-class citizens in the interface. A simple modifier when performing actions will split the interface to show multiple tabs at once. Works with the side bar, tab bar, Goto Anything and more!""",
          style: TextStyle(fontSize: 16),),
      ],
    ),
  );
}

_buildButton(String title,{Color? bgColor,Color? txtColor}){
  return Container(
    width: 110,
    padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
    ),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: bgColor == null ? Colors.white : bgColor,
        border: Border.all(color: Colors.green,)
    ),
    child: Text(title,
      style: TextStyle(
        color: txtColor == null ? Colors.black : txtColor,
      ),
      textAlign: TextAlign.center,
    ),
  );
}

// _buildListProduct(BuildContext context){
//   return Container(
//     //color: Colors.pink,
//     margin: EdgeInsets.only(bottom: 10),
//     padding: EdgeInsets.only(bottom: 10),
//     height: 190,
//     child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: listProduct.length,
//         itemBuilder: (context,index){
//           return _buildProductItem(context,listProduct[index]);
//         }
//     ),
//   );
// }
//
// _buildProductItem(BuildContext context,var product){
//   return InkWell(
//     onTap: (){
//       Navigator.pushNamed(context, ProductDetail().routeName);
//     },
//     child: Container(
//       margin: EdgeInsets.only(
//         left: 10,
//         right: 5,
//       ),
//       width: 125,
//       // clipBehavior: Clip.hardEdge,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             BoxShadow(color: Colors.black12,
//                 blurRadius: 2,
//                 spreadRadius: 2,
//                 offset: Offset(2,4)
//             ),
//           ]
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
//                   height: 90,
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
//           SizedBox(
//             height: 5,
//           ),
//           Row(
//             children: [
//               SizedBox(
//                 width: 8,
//               ),
//               Icon(Icons.star_border_outlined,size: 15,),
//               Icon(Icons.star_border_outlined,size: 15,),
//               Icon(Icons.star_border_outlined,size: 15,),
//               Icon(Icons.star_border_outlined,size: 15,),
//               Icon(Icons.star_border_outlined,size: 15,),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 8),
//             child: Text(
//               "${product["title"]}",
//               style: TextStyle(
//                 fontSize: 20,
//               ),
//             ),
//           ),
//           Row(
//             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               SizedBox(
//                 width: 8,
//               ),
//               Text("\$ ${product["price"]}",
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.green,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Spacer(),
//               Icon(Icons.add_shopping_cart),
//               SizedBox(
//                 width: 8,
//               )
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }