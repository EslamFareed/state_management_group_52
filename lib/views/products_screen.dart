import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_group_52/controllers/prodcuts/produdcts_cubit.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProdudctsCubit.get(context).getProducts();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: BlocConsumer<ProdudctsCubit, ProdudctsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          print(state);
          if (state is ErrorGetProductsState) {
            return const Center(child: Text("error"));
          } else if (state is SuccessGetProductsState) {
            return ListView.builder(
              itemBuilder: (ctx, i) {
                final item = ProdudctsCubit.get(context).products[i];
                return Card(
                  child: ListTile(
                    title: Text(item.title!),
                  ),
                );
              },
              itemCount: ProdudctsCubit.get(context).products.length,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
