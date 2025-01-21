import 'package:flutter_cycle_2_task/product/model/product_model/product_model.dart';

abstract class ProductRepository {
  /* -------------------------------------------------------------------------- */
  /*           Method to fetch products (from an API or other sources)          */
  /* -------------------------------------------------------------------------- */
  Future<List<ProductModel>> getProducts();

  /* -------------------------------------------------------------------------- */
  /*                Method to fetch a specific product by its ID                */
  /* -------------------------------------------------------------------------- */
  Future<ProductModel> getProductById(int id);
}
