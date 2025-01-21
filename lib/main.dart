import 'package:flutter/material.dart';
import 'package:flutter_cycle_2_task/core/service_locator.dart';
import 'package:flutter_cycle_2_task/product/model/repositories/product_repository.dart';
import 'package:flutter_cycle_2_task/product/view/screens/product_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_cycle_2_task/core/network/dio_client.dart';
import 'package:flutter_cycle_2_task/product/viewmodel/product_provider.dart';

/* -------------------------------------------------------------------------- */
/*               Main function to initialize and run the app                  */
/* -------------------------------------------------------------------------- */
void main() {
  // Initialize the service locator
  setupLocator();

  runApp(
    /* -------------------------------------------------------------------------- */
    /*               MultiProvider to provide dependencies to the app             */
    /* -------------------------------------------------------------------------- */
    MultiProvider(
      providers: [
        // Provide DioClient using GetIt
        Provider<DioClient>(create: (_) => sl<DioClient>()),

        // Provide ProductRepository using GetIt
        Provider<ProductRepository>(create: (_) => sl<ProductRepository>()),

        // Provide ProductProvider using ChangeNotifierProvider
        ChangeNotifierProvider(
          create: (context) => ProductProvider(
            productRepository: context.read<ProductRepository>(),
          )..fetchProducts(), // Fetch products on initialization
        ),
      ],
      child: MyApp(), // The root widget of the app
    ),
  );
}

/* -------------------------------------------------------------------------- */
/*               MyApp class to define the main app structure                 */
/* -------------------------------------------------------------------------- */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide debug banner
      home: ProductListScreen(), // Set ProductListScreen as the home screen
    );
  }
}
