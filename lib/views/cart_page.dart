import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import '../constants/theme.dart';
import '../controller/itembag_controller.dart';
import '../widget/animated_swipe.dart';

final couponCodeControllerProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});

final buttonTextProvider = Provider<String>((ref) {
  final text = ref.watch(couponCodeControllerProvider).text;
  return text == 'hello' ? 'Available' : 'Apply';
});

final isFinishedProvider = StateProvider<bool>((ref) => false); // New provider

class CartPage extends ConsumerWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemBag = ref.watch(itemBagProvider);
    double total = ref.watch(priceCalcProvider) -
        9.9 -
        (ref.watch(priceCalcProvider) * 0.25);
    total = (total < 0) ? 0 : total;

    final isFinished = ref.watch(isFinishedProvider); // New

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: const Text(
          'MyCart',
          style: AppTheme.kBigTitle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.local_mall),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(20),
              height: 400,
              child: ListView.builder(
                itemCount: itemBag.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image.asset(
                              itemBag[index].imgUrl,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    itemBag[index].title,
                                    style: AppTheme.kCardText,
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    itemBag[index].shortDescription,
                                    style: AppTheme.kBodyText,
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        '\$${itemBag[index].price}',
                                        style: AppTheme.kCardText,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Have a coupon code? Enter here:'),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade200,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: TextField(
                                controller:
                                    ref.read(couponCodeControllerProvider),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter coupon code',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  // Handle button tap
                                  final couponCode = ref
                                      .watch(couponCodeControllerProvider)
                                      .text;
                                  if (couponCode == 'hello') {
                                    // Coupon code is available
                                    debugPrint('Coupon code is available');
                                  } else {
                                    // Coupon code is not available
                                    // Add your logic here
                                    debugPrint('Coupon code is not available');
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: isFinished
                                        ? const Icon(Icons.check,
                                            color: Colors.green)
                                        : Text(
                                            ref.watch(buttonTextProvider),
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Subtotal',
                            style: AppTheme.kHeadingOne,
                          ),
                          Text(
                            '\$${ref.watch(priceCalcProvider)}',
                            style: AppTheme.kHeadingOne,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery fee',
                            style: AppTheme.kCardText,
                          ),
                          Text(
                            '\$9.9',
                            style: AppTheme.kCardText,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Discount',
                            style: AppTheme.kCardText,
                          ),
                          Text(
                            '25%',
                            style: AppTheme.kCardText,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Divider(
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                            ),
                          ),
                          Text(
                            '\$${total.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                            ),
                          )
                        ],
                      ),
                      const Gap(20),
                      const SizedBox(height: 100, child: AnimationSwipe()),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
