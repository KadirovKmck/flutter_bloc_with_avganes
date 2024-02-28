// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class WishListView extends StatefulWidget {
  const WishListView({super.key});

  @override
  _WishListViewState createState() => _WishListViewState();
}

class _WishListViewState extends State<WishListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wish List'),
      ),
      body: const Center(
        child: Text('Hello, World!'),
      ),
    );
  }
}
