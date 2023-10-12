import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/model/category.dart';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PopularCategoryCard extends StatelessWidget {
  final Category category;

  const PopularCategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
      child: Material(
        elevation: 8,
        shadowColor: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          margin: const EdgeInsets.all(10),
          width: 124,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 2.0,
                child: CachedNetworkImage(
                  imageUrl: baseUrl + category.image,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => Shimmer.fromColors(
                    highlightColor: Colors.white,
                    baseColor: Colors.grey,
                    child: Container(
                      height: 160,
                      color: Colors.grey,
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 35,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(
                      Icons.error_outline,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  bottom: 10,
                ),
                child: Text(
                  category.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
