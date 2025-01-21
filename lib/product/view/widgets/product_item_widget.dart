import 'package:flutter/material.dart';
import 'package:flutter_cycle_2_task/apptheme.dart';
import 'package:flutter_cycle_2_task/product/model/product_model/product_model.dart';

/* -------------------------------------------------------------------------- */
/*               ProductItemWidget to display a single product item           */
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
          color: AppTheme.primaryColor,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          /* -------------------------------------------------------------------------- */
          /*               Display product image                                        */
          /* -------------------------------------------------------------------------- */
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.image,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Positioned(
                right: 6,
                top: 10,
                child: Container(
                  decoration: AppTheme.containerDecoration,
                  child: Icon(
                    Icons.favorite_outline_outlined,
                    color: AppTheme.white,
                    size: 30,
                  ),
                ),
              ),
            ],
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
                  product.title,
                  style: AppTheme.titleTextStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5),
                /* ------------------------ Product description ----------------------- */
                Text(
                  product.description,
                  style: AppTheme.descriptionTextStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5),
                /* ------------------------ Product price ----------------------------- */
                Text(
                  'EGP ${product.price}',
                  style: AppTheme.priceTextStyle,
                ),
                SizedBox(height: 5),
                /* ------------------------ Product rating ---------------------------- */
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Review (${product.rating!.rate?.toStringAsFixed(1) ?? "N/A"}) ⭐',
                      style: AppTheme.reviewTextStyle,
                    ),
                    Spacer(),
                    Container(
                      decoration: AppTheme.containerDecoration,
                      child: Icon(
                        Icons.add,
                        color: AppTheme.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
