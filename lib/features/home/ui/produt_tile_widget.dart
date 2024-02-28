import 'package:flutter/material.dart';
import 'package:flutter_bloc_with_avganes/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_with_avganes/features/home/model/home_product_model_data.dart';

class ProdutTileWidget extends StatelessWidget {
  final ProductModelData productModelData;
  final HomeBloc homeBloc;
  const ProdutTileWidget({
    super.key,
    required this.productModelData,
    required this.homeBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.teal,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.teal,
              ),
              image: DecorationImage(
                image: NetworkImage(productModelData.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            productModelData.name,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            productModelData.description,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${productModelData.price}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(
                          HomeProductWishlistButtomClickEvent(
                            productClick: productModelData,
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.black87,
                        size: 30,
                      )),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                        HomeCardButtomClickEvent(
                          productClick: productModelData,
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.black87,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
