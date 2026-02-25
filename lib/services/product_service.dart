import 'dart:convert';
import 'dart:math';

import 'package:ecommercesetec/config/config.dart';
import 'package:ecommercesetec/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<Product>> fetchProduct() async {
    var url = Uri.https(Config().baseUrl, Config().product);
    var response = await http.get(url);
    if(response.statusCode==200) {
      List<Product> listProduct = productFromJson(response.body);
      return listProduct;
    }else{
      return [];
    }
  }

  Future<Product?> fetchProductByID(int? id) async {
    var url = Uri.https(Config().baseUrl, '${Config().product}/$id');
    var response = await http.get(url);
    if(response.statusCode==200){
      Product product=Product.fromJson(jsonDecode(response.body));
      return product;
    }else{
      return null;
    }
  }
}