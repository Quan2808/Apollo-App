import 'package:apolloshop/common/widgets/appbar/appbar.dart';
import 'package:apolloshop/common/widgets/products/sortable/sortable_products.dart';
import 'package:apolloshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // App bar
        appBar: ApolloAppBar(
          title: Text('Popular Products'),
          showBackArrow: true,
        ),

        // Body
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: SortableProducts(),
          ),
        ));
  }
}
