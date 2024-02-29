part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

sealed class CartActionState extends CartState {
  const CartActionState();
}

final class CartInitial extends CartState {}

final class CartSuccessiState extends CartState {
  final List<ProductModelData> cartItem;

  const CartSuccessiState({required this.cartItem});
}
