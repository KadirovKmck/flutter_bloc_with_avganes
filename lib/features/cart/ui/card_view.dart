// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CardView'),
      ),
      body: const Center(
        child: Text('Hello, World!'),
      ),
    );
  }
}
