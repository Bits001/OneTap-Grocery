import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PopularCategoryLoadingCard extends StatelessWidget {
  const PopularCategoryLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
      child: Material(
        elevation: 8,
        shadowColor: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(10),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade400,
          highlightColor: Colors.white,
          child: Container(
            width: 150,
            height: 140,
            decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}
