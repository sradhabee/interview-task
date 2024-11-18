// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;


// import '../model/product_model.dart';

// class ProductController extends GetxController{
//   var products = <ProductModel>[].obs;
//   var isLoading = true.obs;

// @override
//   void onInit() {
    
//     super.onInit();
//   }


//   Future<void> fetchProducts() async {
//     // try{
//       isLoading(true);
//       final response = await http.get(Uri.parse("https://mansharcart.com/api/products/category/139/key/123456789"));
//       if(response.statusCode==200){
       
      
  
//         final jsonData = jsonDecode(response.body);
//         final productModel = ProductModel.fromJson(jsonData);
//         if(productModel.products!=null){
//           products.value = productModel.products!;
//       }
      
//       else{
//         Get.snackbar("An Error Occured", "Failed to load Products");
//       }
//     }catch (e){
//       Get.snackbar("An error occured", e.toString());
//     }
//        finally {
//       isLoading(false);
//     }
//   }
// }


import 'dart:convert';
import 'package:globosoft_machine_test/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';


class ProductController extends GetxController {
  var products = <Product>[].obs; 
  var isLoading = true.obs;      

  @override
  void onInit() {
    super.onInit();
    fetchProducts(); 
  }

  void fetchProducts() async {
    try {
      isLoading(true); 
      final response = await http.get(
        Uri.parse('https://api.allorigins.win/raw?url=https://mansharcart.com/api/products/category/139/key/123456789'),
      );
         print("Response status: ${response.statusCode}");
         print("Response body: ${response.body}");
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final productModel = ProductModel.fromJson(jsonData);

        if (productModel.products != null) {
          products.value = productModel.products!;
        } else {
          print('No products found in the response');
        }
      } else {
        print('Failed to load products');
      }
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      isLoading(false); 
    }
  }
}