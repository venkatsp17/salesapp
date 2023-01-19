import 'dart:convert';

import 'package:http/http.dart' as http;

class Product{
  final String name;
  final String price;
  final String id;

  const Product({
    required this.name,
    required this.price,
    required this.id
  });

  static Product fromJson(Map<String,dynamic> data) => Product(
    name: data['productname'],
    price: data['productprice'],
    id: data['productid'],
  );

}
class Productsb{
  Future getproducts(String query) async {
    final url2 = Uri.parse("http://127.0.0.1:8000/api/products/");
    http.Response response = await http.get(url2);
    // print('Body: ${response.body}');
    List? resbody = jsonDecode(response.body);
    if (query=="Null"){
      if(response.statusCode==200){
        return resbody;
      }
      else{
        print("Unable to retrieve data");
        return null;
      }
    }
    else{
      if(response.statusCode==200) {
        return resbody?.map((data) => Product.fromJson(data)).where((element) {
          final namelower = element.name.toLowerCase();
          final  querylower = query.toLowerCase();
          return namelower.contains(querylower);
        }).toList();
      }
      else{
        print("Unable to retrieve data");
        return null;
      }
    }
  }
}