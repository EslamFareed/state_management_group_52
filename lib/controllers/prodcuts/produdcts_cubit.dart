import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:state_management_group_52/models/product_model.dart';

part 'produdcts_state.dart';

class ProdudctsCubit extends Cubit<ProdudctsState> {
  ProdudctsCubit() : super(ProdudctsInitial());

  static ProdudctsCubit get(context) => BlocProvider.of(context);

  List<ProductModel> products = [];

  void getProducts() async {
    emit(LoadingGetProductsState());
    try {
      var response =
          await Dio().get("https://api.escuelajs.co/api/v1/products");
      if (response.statusCode == 200) {
        for (var element in response.data) {
          products.add(ProductModel.fromJson(element));
        }
        emit(SuccessGetProductsState());
      } else {
        emit(ErrorGetProductsState());
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorGetProductsState());
    }
  }
}
