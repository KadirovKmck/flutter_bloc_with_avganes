part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

sealed class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedSuccuessState extends HomeState {
  final List<ProductModelData> products;

  const HomeLoadedSuccuessState({
    required this.products,
  });
}

final class HomeErrorState extends HomeState {}

final class HomeNavigatedToCardPageActionState extends HomeActionState {}

final class HomeNavigatedToWishListPageActionState extends HomeActionState {}

final class HomeProductItemWishlistedActionState extends HomeActionState {}

final class HomeProductItemCartedActionState extends HomeActionState {}
