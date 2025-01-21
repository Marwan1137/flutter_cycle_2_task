import 'package:flutter/material.dart';
import 'package:flutter_cycle_2_task/apptheme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_cycle_2_task/product/viewmodel/product_provider.dart';
import 'package:flutter_cycle_2_task/product/view/widgets/product_item_widget.dart';

/* -------------------------------------------------------------------------- */
/*               ProductListScreen to display products in a tabbed view        */
/* -------------------------------------------------------------------------- */
class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

/* -------------------------------------------------------------------------- */
/*               State class for ProductListScreen                             */
/* -------------------------------------------------------------------------- */
class _ProductListScreenState extends State<ProductListScreen>
    with TickerProviderStateMixin {
  /* ---------------------- Controller for managing tabs ---------------------- */
  TabController? _tabController;
  /* ----------------------- List of product categories ----------------------- */
  List<String> _categories = [];

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Product List",
            style: TextStyle(fontSize: 30, color: AppTheme.white),
          ),
        ),
        backgroundColor: AppTheme.primaryColor,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Consumer<ProductProvider>(
            builder: (context, productProvider, child) {
              /* -------------------------------------------------------------------------- */
              /*               Extract categories from products and add 'All' tab           */
              /* -------------------------------------------------------------------------- */
              final categories = productProvider.products
                  .map((product) => product.category)
                  .toSet()
                  .toList();
              /* ----------------------- Add 'All' as the first tab ----------------------- */
              categories.insert(0, 'All');

              /* -------------------------------------------------------------------------- */
              /*               Update TabController if categories change                    */
              /* -------------------------------------------------------------------------- */
              if (_categories != categories) {
                _categories = categories;
                _tabController?.dispose();
                _tabController = TabController(
                  length: categories.length,
                  vsync: this,
                  /* ------------------ Start with 'All' as the selected tab ------------------ */
                  initialIndex: 0,
                );
              }

              /* -------------------------------------------------------------------------- */
              /*               Build the TabBar with categories                             */
              /* -------------------------------------------------------------------------- */
              return _tabController == null
                  /* -------------- Hide TabBar if controller is not initialized -------------- */
                  ? const SizedBox.shrink() //
                  : TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: AppTheme.white,
                      unselectedLabelColor: AppTheme.white,
                      indicatorColor: Colors.transparent,
                      tabs: _categories
                          .map((category) => Tab(text: category))
                          .toList(),

                      /* ------------------------ Rebuild UI on tab change ------------------------ */
                      onTap: (index) {
                        setState(() {});
                      },
                    );
            },
          ),
        ),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          /* -------------------------------------------------------------------------- */
          /*               Handle loading, error, and empty states                      */
          /* -------------------------------------------------------------------------- */
          if (productProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (productProvider.errorMessage.isNotEmpty) {
            return Center(child: Text(productProvider.errorMessage));
          } else if (productProvider.products.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            /* -------------------------------------------------------------------------- */
            /*               Filter products based on the selected tab                    */
            /* -------------------------------------------------------------------------- */
            final filteredProducts = _tabController == null ||
                    _tabController!.index == 0
                ? productProvider.products
                : productProvider.products
                    .where((product) =>
                        product.category == _categories[_tabController!.index])
                    .toList();

            /* -------------------------------------------------------------------------- */
            /*               Display products in a grid view                              */
            /* -------------------------------------------------------------------------- */
            return GridView.builder(
              padding: const EdgeInsets.all(6),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return ProductItemWidget(product: product);
              },
            );
          }
        },
      ),
    );
  }
}
