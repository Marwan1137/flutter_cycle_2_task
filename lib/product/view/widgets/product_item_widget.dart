import 'package:flutter/material.dart';
import 'package:flutter_cycle_2_task/product/model/product_model/product_model.dart';

/* -------------------------------------------------------------------------- */
/*               ProductItemWidget to display a single product item            */
/* -------------------------------------------------------------------------- */
class ProductItemWidget extends StatelessWidget {
  final ProductModel product; // Product data to display

  const ProductItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Color(0xff8E6CEF),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          /* -------------------------------------------------------------------------- */
          /*               Display product image                                        */
          /* -------------------------------------------------------------------------- */
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              product.image,
              height: 180,
              width: double.infinity,
              fit: BoxFit.scaleDown,
            ),
          ),
          /* -------------------------------------------------------------------------- */
          /*               Display product details                                      */
          /* -------------------------------------------------------------------------- */
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* ------------------------ Product title ----------------------------- */
                Text(
                  product.title, // Product title
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5,
                ),
                /* ------------------------ Product description ----------------------- */
                Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5,
                ),
                /* ------------------------ Product price ----------------------------- */
                Text(
                  'EGP ${product.price}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                /* ------------------------ Product rating ---------------------------- */
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Review (${product.rating!.rate?.toStringAsFixed(1) ?? "N/A"}) ⭐',
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
