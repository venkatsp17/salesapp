import 'dart:convert';

import 'package:http/http.dart' as http;

class Product{
  final String ProductName;
  final String Price;
  final int ProductId;
  final int KG;

  const Product({
    required this.ProductName,
    required this.Price,
    required this.ProductId,
    required this.KG
  });

  static Product fromJson(Map<String,dynamic> data) => Product(
    ProductName: data['ProductName'],
    Price: data['Price'],
    ProductId: data['ProductId'],
      KG: data['KG']
  );

}
class Productsb{
  Future getproducts(String query) async {
    final url2 = Uri.parse("http://10.0.2.2:8000/api/products/");
    http.Response response = await http.get(url2);
    // print('Body: ${response.body}');
    List? resbody = jsonDecode(response.body);
    if (query=="Null"){
      if(response.statusCode==200){
        return resbody?.map((data) => Product.fromJson(data)).toList();
      }
      else{
        print("Unable to retrieve data");
        return null;
      }
    }
    else{
      if(response.statusCode==200) {
        return resbody?.map((data) => Product.fromJson(data)).where((element) {
          final namelower = element.ProductName.toLowerCase();
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