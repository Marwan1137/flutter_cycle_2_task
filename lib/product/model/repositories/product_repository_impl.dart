// lib/product/model/repositories/product_repository_impl.dart
import 'package:dio/dio.dart';
import 'package:flutter_cycle_2_task/core/network/dio_client.dart';
import 'package:flutter_cycle_2_task/product/model/product_model/product_model.dart';
import 'package:flutter_cycle_2_task/product/model/repositories/product_repository.dart';

/* -------------------------------------------------------------------------- */
/*               Implements ProductRepository to fetch product data            */
/* -------------------------------------------------------------------------- */
class ProductRepositoryImpl implements ProductRepository {
  final DioClient dioClient; // DioClient instance for making HTTP requests

  /* -------------------------------------------------------------------------- */
  /*                  Constructor to initialize DioClient                       */
  /* -------------------------------------------------------------------------- */
  ProductRepositoryImpl({required this.dioClient});

  /* -------------------------------------------------------------------------- */
  /*                    Fetches a list of products from the API                 */
  /* -------------------------------------------------------------------------- */
  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      /* ------------------ Perform GET request to fetch products ----------------- */
      Response response = await dioClient.get('/products');

      /* --------- Map the response data to a list of ProductModel objects -------- */
      List<ProductModel> products = (response.data as List)
          .map((product) => ProductModel.fromJson(product))
          .toList();

      return products; // Return the list of products
    } catch (e) {
      // Handle and throw exceptions
      throw Exception('Failed to load products: $e');
    }
  }

  /* -------------------------------------------------------------------------- */
  /*                    Fetches a single product by its ID                      */
  /* -------------------------------------------------------------------------- */
  @override
  Future<ProductModel> getProductById(int id) => throw UnimplementedError();
}
