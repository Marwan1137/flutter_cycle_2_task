/* -------------------------------------------------------------------------- */
/*                   Sets up service locator and dependency injection          */
/* -------------------------------------------------------------------------- */
import 'package:flutter_cycle_2_task/core/network/dio_client.dart';
import 'package:flutter_cycle_2_task/product/model/repositories/product_repository.dart';
import 'package:flutter_cycle_2_task/product/model/repositories/product_repository_impl.dart';
import 'package:get_it/get_it.dart';

/* -------------------------------------------------------------------------- */
/*                        GetIt instance for service locator                  */
/* -------------------------------------------------------------------------- */
final GetIt sl = GetIt.instance;

/* -------------------------------------------------------------------------- */
/*          Function to set up dependency injection and register services       */
/* -------------------------------------------------------------------------- */
void setupLocator() {
  /* -------------------------------------------------------------------------- */
  /*              Registers DioClient for HTTP requests handling                */
  /* -------------------------------------------------------------------------- */
  sl.registerSingleton<DioClient>(DioClient());

  // Register ProductRepositoryImpl as a singleton, but expose it as ProductRepository
  /* -------------------------------------------------------------------------- */
  /*           Registers ProductRepositoryImpl with DioClient dependency        */
  /* -------------------------------------------------------------------------- */
  sl.registerSingleton<ProductRepository>(
    ProductRepositoryImpl(
        dioClient:
            sl<DioClient>()), // Inject DioClient into ProductRepositoryImpl
  );
}
