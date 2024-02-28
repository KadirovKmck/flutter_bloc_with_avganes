part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtomClickEvent extends HomeEvent {
  final ProductModelData productClick;

  const HomeProductWishlistButtomClickEvent({required this.productClick});
}

class HomeCardButtomClickEvent extends HomeEvent {
  final ProductModelData productClick;

  const HomeCardButtomClickEvent({required this.productClick});
}

class HomeWishlistNavigatorClickEvent extends HomeEvent {}

class HomeCardNavigatorClickEvent extends HomeEvent {}
