// ignore_for_file: type_literal_in_constant_pattern, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_with_avganes/features/cart/ui/card_view.dart';
import 'package:flutter_bloc_with_avganes/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_with_avganes/features/home/ui/produt_tile_widget.dart';
import 'package:flutter_bloc_with_avganes/features/wish_list/ui/wish_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {
          if (state is HomeNavigatedToWishListPageActionState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WishListView(),
              ),
            );
          } else if (state is HomeNavigatedToCardPageActionState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CardView(),
              ),
            );
          } else if (state is HomeProductItemWishlistedActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Wish list item is added'),
              ),
            );
          } else if (state is HomeProductItemCartedActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Card item is added'),
              ),
            );
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case HomeLoadingState:
              return const Scaffold(
                  body: Center(
                child: CircularProgressIndicator(),
              ));
            case HomeLoadedSuccuessState:
              final successState = state as HomeLoadedSuccuessState;
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.teal,
                  title: const Text('Wellcom  to  Flutter shop'),
                  titleTextStyle:
                      const TextStyle(color: Colors.white, fontSize: 25),
                  actions: [
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeWishlistNavigatorClickEvent());
                        },
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        )),
                    IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCardNavigatorClickEvent());
                      },
                      icon: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProdutTileWidget(
                        homeBloc: homeBloc,
                        productModelData: successState.products[index]);
                  },
                ),
              );

            case HomeErrorState:
              return const Scaffold(body: Center(child: Text('Error')));
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}

        // switch (state.runtimeType) {
        //   case HomeLoadingState:
        //     return const Scaffold(
        //       body: Center(
        //         child: CircularProgressIndicator(),
        //       ),
        //     );
        //   case HomeLoadedSuccuessState:
        //     return Scaffold(
        //       appBar: AppBar(
        //         backgroundColor: Colors.blue,
        //         title: const Text(
        //           'Wellcom',
        //           style: TextStyle(color: Colors.white),
        //         ),
        //         actions: [
        //           IconButton(
        //             onPressed: () {
        //               homeBloc.add(HomeWishlistNavigatorClickEvent());
        //             },
        //             icon: const Icon(
        //               Icons.favorite_border,
        //               color: Colors.white,
        //             ),
        //           ),
        //           IconButton(
        //             onPressed: () {
        //               homeBloc.add(HomeCardNavigatorClickEvent());
        //             },
        //             icon: const Icon(
        //               Icons.shopping_bag_outlined,
        //               color: Colors.white,
        //             ),
        //           ),
        //         ],
        //       ),
        //     );
        //   case HomeErrorState:
        //     return const Scaffold(
        //       body: Center(
        //         child: Text('Error '),
        //       ),
        //     );
        //   default:
        //     return const SizedBox();
        // }