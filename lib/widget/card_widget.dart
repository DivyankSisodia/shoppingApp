import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:shopping/model/product_model.dart';

import '../constants/theme.dart';
import '../controller/itembag_controller.dart';
import '../controller/product_controller.dart';

class ProductCardWidget extends ConsumerWidget {
  const ProductCardWidget({
    super.key,
    required this.productIndex,
  });

  final int productIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productNotifierProvider);
    return Container(
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 6),
            spreadRadius: 2,
          ),
        ],
      ),
      margin: const EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12),
              color: kLightBackground,
              child: Image.asset(
                product[productIndex].imgUrl,
                width: double.infinity,
              ),
            ),
          ),
          const Gap(4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product[productIndex].title,
                  style: AppTheme.kCardText,
                ),
                // const Gap(5),
                Text(
                  product[productIndex].shortDescription,
                  style: AppTheme.kBodyText,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${product[productIndex].price}',
                      style: AppTheme.kCardText,
                    ),
                    IconButton(
                      onPressed: () {
                        ref
                            .read(productNotifierProvider.notifier)
                            .isSelectedItem(
                              product[productIndex].pid,
                              productIndex,
                            );
                        if (product[productIndex].isSelected == false) {
                          ref
                              .read(itemBagProvider.notifier)
                              .addNewItemsBag(ProductModel(
                                pid: product[productIndex].pid,
                                imgUrl: product[productIndex].imgUrl,
                                title: product[productIndex].title,
                                price: product[productIndex].price,
                                shortDescription:
                                    product[productIndex].shortDescription,
                                longDescription:
                                    product[productIndex].longDescription,
                                review: product[productIndex].review,
                                rating: product[productIndex].rating,
                              ));
                        } else {
                          ref
                              .read(itemBagProvider.notifier)
                              .removeItemBag(product[productIndex].pid);
                        }
                        print(product[productIndex].isSelected);
                      },
                      icon: Icon(
                        product[productIndex].isSelected
                            ? Icons.check_circle
                            : Icons.add_circle,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
