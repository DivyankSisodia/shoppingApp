import 'package:flutter/material.dart';
import 'package:shopping/views/home_page.dart';
import 'package:lottie/lottie.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  bool animate = false;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: animate ? 0 : 30,
              left: animate ? -10 : -30,
              child: const Image(
                image: AssetImage(
                  'assets/splash/morphis-payment-by-smartphone-by-qr-code.png',
                ),
                height: 100,
                width: 200,
              ),
            ),
            AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                top: 96,
                left: animate ? 30 : -30,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1600),
                  opacity: animate ? 1 : 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          ".Shopping/",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      const Text(
                        "Love To Shop. \nVisit Us !!",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
            // const SizedBox(
            //   height: 20,
            // ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom: animate ? 10 : 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                opacity: animate ? 1 : 0,
                child: Lottie.asset(
                  'assets/splash/spash_screen.json',
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            const Positioned(
              bottom: 40,
              right: 30,
              child: Image(
                image: AssetImage(
                  'assets/splash/neon-cart.png',
                ),
                height: 100,
                width: 100,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 1200));
    setState(() {
      animate = true;
    });
    await Future.delayed(const Duration(milliseconds: 3200));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }
}
