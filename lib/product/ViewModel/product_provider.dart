import 'package:flutter/material.dart';
import 'package:flutter_cycle_2_task/product/model/repositories/product_repository.dart';
import 'package:flutter_cycle_2_task/product/model/product_model/product_model.dart';

/* -------------------------------------------------------------------------- */
/*               ProductProvider to manage product data and state              */
/* -------------------------------------------------------------------------- */
class ProductProvider with ChangeNotifier {
  final ProductRepository productRepository; // Repository to fetch product data

  ProductProvider({required this.productRepository});

  /* -------------------------------------------------------------------------- */
  /*               Private fields to store product data and state               */
  /* -------------------------------------------------------------------------- */
  List<ProductModel> _products = []; // List of products
  bool _isLoading = false; // Loading state
  String _errorMessage = ''; // Error message

  /* -------------------------------------------------------------------------- */
  /*               Getters to access private fields                             */
  /* -------------------------------------------------------------------------- */
  List<ProductModel> get products => _products; // Getter for products
  bool get isLoading => _isLoading; // Getter for loading state
  String get errorMessage => _errorMessage; // Getter for error message

  /* -------------------------------------------------------------------------- */
  /*               Fetches products from the repository                         */
  /* -------------------------------------------------------------------------- */
  Future<void> fetchProducts() async {
    _isLoading = true; // Set loading state to true
    notifyListeners(); // Notify listeners to update the UI

    try {
      _products = await productRepository.getProducts(); // Fetch products
      _errorMessage = ''; // Clear any previous error message
    } catch (e) {
      _errorMessage = e.toString(); // Set error message if an exception occurs
    } finally {
      _isLoading = false; // Set loading state to false
      notifyListeners(); // Notify listeners to update the UI
    }
  }
}
