import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const CardLoading(
      height: 12,
      borderRadius: BorderRadius.all(Radius.circular(15)),
      width: 160,
      margin: EdgeInsets.only(bottom: 10),
    );
  }
}
