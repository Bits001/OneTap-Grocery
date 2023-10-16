import 'package:ecommerce_app/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get_state_manager/get_state_manager.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 10,
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(24),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  offset: const Offset(0, 0),
                  blurRadius: 8,
                )
              ],
            ),
            child: Obx(() => TextField(
                  autofocus: false,
                  controller: productController.searchTextEditingController,
                  onSubmitted: (value) {
                    productController.getProductByName(keyword: value);
                    dashboardController.updateIndex(1);
                  },
                  onChanged: (value) {
                    productController.searchVal.value = value;
                  },
                  decoration: InputDecoration(
                    suffixIcon: productController.searchVal.value.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              productController.searchTextEditingController
                                  .clear();
                              productController.searchVal.value = '';
                              productController.getProducts();
                            },
                            icon: const Icon(Icons.clear),
                          )
                        : null,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 16,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Search",
                    prefixIcon: const Icon(Icons.search),
                  ),
                )),
          )),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    blurRadius: 8,
                  )
                ]),
            padding: const EdgeInsets.all(12),
            child: const Icon(
              Icons.filter_alt_rounded,
              //color: Colors.grey,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          badges.Badge(
            badgeContent: const Text(
              "1",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            badgeStyle: const badges.BadgeStyle(
              badgeColor: Colors.blue,
            ),
            child: Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      blurRadius: 8,
                    )
                  ]),
              padding: const EdgeInsets.all(12),
              child: const Icon(
                Icons.shopping_bag_rounded,
                //color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(
            width: 7,
          )
        ],
      ),
    );
  }
}
