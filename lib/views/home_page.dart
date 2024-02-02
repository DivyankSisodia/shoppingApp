import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shopping/constants/theme.dart';
import 'package:shopping/widget/chip_widget.dart';

import '../widget/ad_banner_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: SvgPicture.asset(
          'assets/general/store_brand_white.svg',
          color: kWhiteColor,
          width: 180,
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
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // Ad banner
              AdBannerWidget(),
              // chip section
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: const [
                    ChipWidget(title: 'All'),
                    Gap(10),
                    ChipWidget(title: 'Phone'),
                    Gap(10),
                    ChipWidget(title: 'Laptop'),
                    Gap(10),
                    ChipWidget(title: 'Tablet'),
                    Gap(10),
                    ChipWidget(title: 'Accessories'),
                  ],
                ),
              ),
              const Gap(20),
              // hot sales
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hot Sales',
                    style: AppTheme.kHeadingOne,
                  ),
                  Text(
                    'See All',
                    style: AppTheme.kSeeAllText,
                  ),
                ],
              ),
              const Gap(12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(4),
                height: 290,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) => Container(
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 6),
                            spreadRadius: 2),
                      ],
                    ),
                    margin: const EdgeInsets.all(12),
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            color: kLightBackground,
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              const Text('Product name'),
                              // const Gap(5),
                              const Text('Short Description'),
                              Row(
                                children: [
                                  const Text('\$854'),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.add_circle),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
              // featured products
            ],
          ),
        ),
      ),
    );
  }
}
