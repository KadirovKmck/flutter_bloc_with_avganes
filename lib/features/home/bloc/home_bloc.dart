// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_with_avganes/data/cart_item.dart';
import 'package:flutter_bloc_with_avganes/data/grocery_data.dart';
import 'package:flutter_bloc_with_avganes/data/wishlist_item.dart';
import 'package:flutter_bloc_with_avganes/features/home/model/home_product_model_data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtomClickEvent>(
      homeProductWishlistButtomClickEvent,
    );
    on<HomeCardButtomClickEvent>(
      homeCardButtomClickEvent,
    );
    on<HomeWishlistNavigatorClickEvent>(
      homeWishlistNavigatorClickEvent,
    );
    on<HomeCardNavigatorClickEvent>(
      homeCardNavigatorClickEvent,
    );
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(
      HomeLoadedSuccuessState(
        products: GroceryData.groceryProducts
            .map(
              (e) => ProductModelData(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl'],
              ),
            )
            .toList(),
      ),
    );
  }

  FutureOr<void> homeProductWishlistButtomClickEvent(
    HomeProductWishlistButtomClickEvent event,
    Emitter<HomeState> emit,
  ) {
    log('Wish product list ');
    wishlistItem.add(event.productClick);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeCardButtomClickEvent(
    HomeCardButtomClickEvent event,
    Emitter<HomeState> emit,
  ) {
    log('Card product list');
    cartItem.add(event.productClick);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeWishlistNavigatorClickEvent(
    HomeWishlistNavigatorClickEvent event,
    Emitter<HomeState> emit,
  ) {
    log('Wish  list is navigat ');
    emit(HomeNavigatedToWishListPageActionState());
  }

  FutureOr<void> homeCardNavigatorClickEvent(
    HomeCardNavigatorClickEvent event,
    Emitter<HomeState> emit,
  ) {
    log('Card  list is navigat');
    emit(HomeNavigatedToCardPageActionState());
  }
}
