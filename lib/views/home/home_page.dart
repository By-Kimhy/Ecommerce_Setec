import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildBanner(),
          _buildTitle("Shop by Categories"),
          _buildListCategory(),
          _buildTitle("Special Offers"),
          _buildListProduct(),
        ],
      )

    );
  }
}

_buildBanner(){
  return Container(
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

var listProduct=[
  {
    "title":"Pizza",
    "image":"https://www.recipetineats.com/tachyon/2023/05/Garlic-cheese-pizza_9.jpg",
    "price":"20",
  },
  {
    "title":"Pizza",
    "image":"https://www.recipetineats.com/tachyon/2023/05/Garlic-cheese-pizza_9.jpg",
    "price":"20",
  },
  {
    "title":"Pizza",
    "image":"https://www.recipetineats.com/tachyon/2023/05/Garlic-cheese-pizza_9.jpg",
    "price":"20",
  },
  {
    "title":"Pizza",
    "image":"https://www.recipetineats.com/tachyon/2023/05/Garlic-cheese-pizza_9.jpg",
    "price":"20",
  },
  {
    "title":"Pizza",
    "image":"https://www.recipetineats.com/tachyon/2023/05/Garlic-cheese-pizza_9.jpg",
    "price":"20",
  },
  {
    "title":"Pizza",
    "image":"https://www.recipetineats.com/tachyon/2023/05/Garlic-cheese-pizza_9.jpg",
    "price":"20",
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

_buildListProduct(){
  return Container(
    //color: Colors.pink,
    height: 240,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listProduct.length,
        itemBuilder: (context,index){
          return _buildProductItem(listProduct[index]);
        }
    ),
  );
}

_buildProductItem(var product){
  return Container(
    margin: EdgeInsets.only(
      left: 10,
      right: 5
    ),
    width: 125,
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(color: Colors.black12,
          blurRadius: 2,
          spreadRadius: 2,
          offset: Offset(2, 4)
        ),
      ]
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image.network("${product["image"]}"),
            Positioned(
              right: 5,
                top: 5,
                child: Icon(Icons.favorite_border)),
          ],
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
              "${product["title"]}",
              style: TextStyle(
                fontSize: 20,
              ),
          ),
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 8,
            ),
            Text("\$ ${product["price"]}",
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
  );
}