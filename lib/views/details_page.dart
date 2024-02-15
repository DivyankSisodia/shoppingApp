import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:shopping/constants/theme.dart';
import 'package:shopping/controller/product_controller.dart';
import 'package:shopping/views/cart_page.dart';
import 'package:shopping/views/home_page.dart';

// ignore: must_be_immutable
class DetailsPage extends ConsumerWidget {
  DetailsPage({
    super.key,
    required this.getIndex,
  });

  int getIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    final product = ref.watch(productNotifierProvider);

    double x = product[getIndex].review / 100;

    if (x > 5) {
      x = 5;
    } else {
      x = x;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: Text(
          product[getIndex].title,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: kLightBackground,
              child: Image.asset(
                product[getIndex].imgUrl,
                width: double.infinity,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product[getIndex].title,
                    style: AppTheme.kBigTitle.copyWith(
                      color: kPrimaryColor,
                    ),
                  ),
                  const Gap(12),
                  Row(
                    children: [
                      RatingBar(
                        itemSize: 20,
                        initialRating: x.toDouble(),
                        maxRating: 5,
                        minRating: 1,
                        allowHalfRating: true,
                        ratingWidget: RatingWidget(
                          full: Icon(
                            Icons.star,
                            color: Colors.amber.shade400,
                          ),
                          half: Icon(
                            Icons.star_half,
                            color: Colors.amber.shade400,
                          ),
                          empty: Icon(
                            Icons.star_border,
                            color: Colors.amber.shade400,
                          ),
                        ),
                        onRatingUpdate: (value) {},
                      ),
                      const Gap(20),
                      Text('${product[getIndex].review} Reviews'),
                    ],
                  ),
                  const Gap(10),
                  Text(
                    product[getIndex].longDescription,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  const Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${(product[getIndex].price * product[getIndex].quantity).clamp(0, double.infinity)}',
                        style: AppTheme.kBigTitle.copyWith(
                          color: kPrimaryColor,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              ref
                                  .read(productNotifierProvider.notifier)
                                  .decreasetQty(product[getIndex].pid);
                            },
                            icon: const Icon(
                              Icons.do_not_disturb_on_outlined,
                              color: kPrimaryColor,
                            ),
                          ),
                          Text(
                            product[getIndex].quantity.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              ref
                                  .read(productNotifierProvider.notifier)
                                  .incrementQty(product[getIndex].pid);
                            },
                            icon: const Icon(
                              Icons.add_circle_outline,
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Gap(20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartPage()),
                      );
                      debugPrint('hawla h kya re');
                    },
                    child: const Text(
                      'Add items to cart',
                      style: TextStyle(color: kWhiteColor, fontSize: 18),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kDefaultIconDarkColor,
        currentIndex: currentIndex,
        onTap: (value) =>
            ref.read(currentIndexProvider.notifier).update((state) => value),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.house_outlined,
              size: 25,
            ),
            label: 'Home',
            activeIcon: Icon(Icons.house),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'favorite',
            activeIcon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'cart',
            activeIcon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
    );
  }
}
