import 'package:flutter/material.dart';
import 'package:card_loading/card_loading.dart';
import 'package:shopping_app/src/views/widgets/shimmer_card.dart';

class LoadingShimmerWidget extends StatelessWidget {
  const LoadingShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ShimmerCard(),
          ShimmerCard(),
          ShimmerCard(),
          ShimmerCard(),
          ShimmerCard(),
          ShimmerCard(),
          ShimmerCard(),
          ShimmerCard(),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
