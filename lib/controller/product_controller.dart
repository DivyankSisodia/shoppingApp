import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/data/product_list.dart';

import '../model/product_model.dart';

class ProductNotifier extends StateNotifier<List<ProductModel>> {
  ProductNotifier() : super(productItems);

  void incrementQty(int pid) {
    state = [
      for (final product in state)
        if (product.pid == pid)
          product.copyWith(quantity: product.quantity += 1)
        else
          product,
    ];
  }

  void decreasetQty(int pid) {
    state = [
      for (final product in state)
        if (product.pid == pid)
          product.copyWith(quantity: product.quantity -= 1)
        else
          product,
    ];
  }
}

final productNotifierProvider =
    StateNotifierProvider<ProductNotifier, List<ProductModel>>((ref) {
  return ProductNotifier();
});
