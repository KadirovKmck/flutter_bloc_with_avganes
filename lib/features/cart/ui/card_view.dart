// ignore_for_file: type_literal_in_constant_pattern

import 'package:flutter_bloc/flutter_bloc.dart';
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc_with_avganes/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc_with_avganes/features/cart/ui/cart_produkt_tile.dart';

class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  final CartBloc cardBloc = CartBloc();
  @override
  void initState() {
    cardBloc.add(
      CartInitialEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CardView'),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cardBloc,
        listener: (context, state) {},
        buildWhen: (previous, current) => current is CartActionState,
        listenWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessiState:
              final successState = state as CartSuccessiState;
              return ListView.builder(
                  itemCount: successState.cartItem.length,
                  itemBuilder: (context, index) {
                    return CartTileWidget(
                        cartBloc: cardBloc,
                        productModelData: successState.cartItem[index]);
                  });
            default:
          }
          return Container();
        },
      ),
    );
  }
}
