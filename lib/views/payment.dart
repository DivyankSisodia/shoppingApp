import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shopping/constants/theme.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late Razorpay _razorpay;
  TextEditingController amtController = TextEditingController();

  void openCheckout(amount) async {
    amount = amount * 100;
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': amount,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'prefill': {
        'contact': '8888888888',
        'email': 'test@gmail.com',
      },
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Successful ${response.paymentId!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Failed ${response.code} - ${response.message!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "External Wallet ${response.walletName!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Payment',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Lottie.network(
                'https://lottie.host/51612276-16f4-4e57-b1ae-33f1217088b0/ZdRkGj5eDe.json',
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Enter the amount to pay',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: amtController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Amount to be paid',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the amount';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  debugPrint('hello');
                  if (amtController.text.toString().isNotEmpty) {
                    int amount = int.parse(amtController.text.toString());
                    openCheckout(amount);
                  }
                },
                child: const Text('Pay'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
