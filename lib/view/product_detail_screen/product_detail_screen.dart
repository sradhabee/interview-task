
import 'package:flutter/material.dart';


import '../../model/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
       child: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: NetworkImage("https://mansharcart.com/image/${product.thumb}".replaceAll("\\",""),
              
              )
              ,
              fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(product.name??'Name not provided',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          SizedBox(height: 6,),
          Text("Price : ${product.price}/-",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
          SizedBox(height: 6,),
          Text(product.description ??'No description',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
          SizedBox(height: 6,),
          Text( 'Stock Status : ${product.stockStatus}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
          
        SizedBox(height: 6,),
          Text( 'Manufacturer : ${product.manufacturer}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
          SizedBox(height: 6,),
          if (product.rating != null && product.rating! > 0) ...[
         Text('Rating: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
         SizedBox(height: 6),
         Row(
           children: List.generate(
        product.rating!.toInt(),  
        (index) => Icon(Icons.star, color: Colors.yellow),
           ),
         ),
       ] else ...[
         Text('No rating available', style: TextStyle(fontSize: 15)),
       ]
       
       
        ],
       ),
     ), 

    );
  }
}