import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/data/product_list.dart';

import '../model/product_model.dart';

class ProductNotifier extends StateNotifier<List<ProductModel>> {
  ProductNotifier() : super(productItems);

  void isSelectedItem(int pid, int index) {
    state = [
      for (final product in state)
        if (product.pid == pid)
          product.copyWith(isSelected: !product.isSelected)
        else
          product
    ];
  }

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
    state = state.map((product) {
      if (product.pid == pid) {
        // Check if the quantity is greater than 0 before decrementing
        int newQuantity = product.quantity - 1;
        return product.copyWith(quantity: newQuantity >= 0 ? newQuantity : 0);
      } else {
        return product;
      }
    }).toList();
  }
}

final productNotifierProvider =
    StateNotifierProvider<ProductNotifier, List<ProductModel>>((ref) {
  return ProductNotifier();
});
