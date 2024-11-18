
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:globosoft_machine_test/controller/product_controller.dart';
import 'package:globosoft_machine_test/view/product_detail_screen/product_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
   final ProductController controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Obx(() {
        if(controller.isLoading.value){
          return Center(child: CircularProgressIndicator());
        }
        if(controller.products.isEmpty){
          return Center(child: Text("No products found"),);
        }
        return GridView.builder(
          itemCount: controller.products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75
          ), itemBuilder: (context, index) {
            final product = controller.products[index];
            return GestureDetector(
              onTap: () {
                 Get.to(ProductDetailScreen(product: product));
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.network('https://mansharcart.com/image/${product.thumb}'.replaceAll("\\","/"),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Icon(Icons.image_not_supported_sharp),
                      ),
              
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.name??"No name",style: TextStyle(
                              fontSize: 20,fontWeight: FontWeight.bold,
                              
                            ),maxLines: 1),
                            SizedBox(height: 5,),
                            Text('${product.price??' 0.00'}',
                            style: TextStyle(
                              color: Colors.blue,
                            ),),
              
              
                            
                          ],
                        ),
                      )
              
                  ],
                ),
              ),
            );
          },);
      })
    );
  }
}