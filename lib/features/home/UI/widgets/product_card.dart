import 'package:ecommerce_app/features/description/UI/pages/product_desciption.dart';
import 'package:ecommerce_app/features/product/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {

  final Product product;
  const ProductCard({
    Key? key,
    required this.product
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder:(context) =>  ProductDetails(productID: product.id,)));
        
      },
      child: Stack(
        children:[
           Container(
          margin: const EdgeInsets.only(top: 65),
          padding: const EdgeInsets.symmetric(horizontal: 12,),
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
            // color: Color(0xFFf9f4f6),
            color: const Color(0xFFEEEEEE),
            borderRadius: BorderRadius.circular(4),
            
          ),
          child: Column(
            children: [
              
              const SizedBox(height: 50,),
              Text(
                product.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),),
    
              const SizedBox(height: 5,),
    
              Text(
                product.brand,
                maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,),
              const SizedBox(height: 12,),
              Text(
                "Rs ${product.price}",
                style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w800,
              ),),
            ],
          ),
        ),
        Positioned(
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.center,
                  child: Image.network(
                    product.image,
                    height: 120,
                    
                    ),
                ),
              ),
              
        ],
      ),
    );
  }
}
