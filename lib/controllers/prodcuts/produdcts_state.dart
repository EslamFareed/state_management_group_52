part of 'produdcts_cubit.dart';

@immutable
sealed class ProdudctsState {}

final class ProdudctsInitial extends ProdudctsState {}

class LoadingGetProductsState extends ProdudctsState {}

class SuccessGetProductsState extends ProdudctsState {}

class ErrorGetProductsState extends ProdudctsState {}
