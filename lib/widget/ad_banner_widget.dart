import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/theme.dart';

class AdBannerWidget extends StatelessWidget {
  const AdBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Apple Store',
                    style: AppTheme.kBigTitle,
                  ),
                  const Gap(12),
                  Text(
                    "Find the Apple product and accessories you're looking for.",
                    style: AppTheme.kBodyText.copyWith(
                      color: kWhiteColor,
                    ),
                  ),
                  const Gap(8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kWhiteColor,
                      foregroundColor: kSecondaryColor,
                    ),
                    onPressed: () {},
                    child: const Text('Shop Now'),
                  ),
                ],
              ),
            ),
          ),
          Image.asset('assets/general/landing.png'),
        ],
      ),
    );
  }
}
