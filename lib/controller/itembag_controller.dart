import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/product_model.dart';

List<ProductModel> itemBag = [];

class ItemBagNotifier extends StateNotifier<List<ProductModel>> {
  ItemBagNotifier() : super(itemBag);

  // add new items
  void addNewItemsBag(ProductModel product) {
    state = [...state, product];
  }

  // remove items
  void removeItemBag(int pid) {
    state = [
      for (final product in state)
        if (product.pid != pid) product
    ];
  }
}

final itemBagProvider =
    StateNotifierProvider<ItemBagNotifier, List<ProductModel>>((ref) {
  return ItemBagNotifier();
});

final priceCalcProvider = StateProvider<double>((ref) {
  final itemBagPrice = ref.watch(itemBagProvider);
  double total = 0;
  for (final product in itemBagPrice) {
    total += product.price * product.quantity;
  }
  return total;
});
