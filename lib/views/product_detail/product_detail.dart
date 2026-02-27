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
  List<Product> listProduct=[];
  int? id;
  Product? productData;

  @override
  void didChangeDependencies() {
    var data=ModalRoute.of(context)?.settings.arguments as Map;
    id = int.parse(data["id"]);
    fetchProductByID(id!);
    fetchProductData();
    super.didChangeDependencies();
  }

  Future<void> fetchProductData() async {
    listProduct= await _productService.fetchProduct();
    setState(() {
    });
  }

  Future<void> fetchProductByID(int id) async {
    final data = await _productService.fetchProductByID(id);
    setState(() {
      productData = data;
    });
    print("Data-Detail--${jsonEncode(productData)}");
  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Detail'),
//         actions: [
//           Stack(
//             children: [
//               Icon(Icons.shopping_cart,size: 28,),
//               Positioned(
//                 right: 0,
//                 top: 0,
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 4),
//                   decoration: BoxDecoration(
//                     color: Colors.red,
//                     borderRadius: BorderRadius.circular(100),
//                   ),
//                   child: Text('2',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 10,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//           SizedBox(
//             width: 20,
//           )
//         ],
//       ),
//       body: ListView(
//         children: [
//           _buildBanner(productData),
//           _buildTitleDetail(productData),
//           _buildTitle("Related Products"),
//           //_buildListProduct(context),
//
//         ],
//       ),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    // if (productData == null) {
    //   return Scaffold(
    //     body: Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //   );
    // }

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
      body: productData==null?
      Center(
          child: CircularProgressIndicator()
      )
          :
      ListView(
        children: [
          _buildBanner(productData),
          _buildTitleDetail(productData),
          _buildTitle("Related Products"),
          _buildListProduct(context,listProduct),
        ],
      ),
    );
  }
  }

_buildBanner(Product? productData){
  return Container(
    height: 350,
    child: Image.network(
        productData!.image,
        fit: BoxFit.contain,
    )
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

_buildTitleDetail(Product? productData){
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Text(
                productData!.title,
                style: TextStyle(fontSize: 25),),
            ),
            Expanded(
              flex: 1,
              child: Icon(Icons.favorite_border),),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        _buildRating(productData!.rating),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(
              "\$${productData!.price}",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.green,
                  fontWeight: FontWeight.bold
              ),
            ),
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
          productData.description,
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

_buildRating(Rating rating) {
  return Row(
    children: [
      ...List.generate(5, (index) {
        if (index < rating.rate.floor()) {
          return Icon(Icons.star, size: 20, color: Colors.orange);
        } else if (index < rating.rate) {
          return Icon(Icons.star_half, size: 20, color: Colors.orange);
        } else {
          return Icon(Icons.star_border, size: 20);
        }
      }),
      SizedBox(width: 5),
      Text(
        "(${rating.rate.toStringAsFixed(1)})",
        style: TextStyle(fontSize: 18),
      ),
      SizedBox(width: 5),
      Text(
        "[${rating.count}]",
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
    ],
  );
}