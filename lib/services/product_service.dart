import 'package:ecommercesetec/config/config.dart';
import 'package:http/http.dart' as http;

class ProductService {
  void fetchProduct(){
    var url = Uri.https(Config().baseUrl, Config().product);
  }
}