import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class PaymentSelectionView extends StatelessWidget {
  final List<String> paymentOptions = [
    'Dana (089680611882)',
    'Bank Transfer (081234567890)',
    'Credit Card (0123456789)',
    'PayPal (example@example.com)',
    'Gopay (081234567890)',
    'OVO (081234567890)',
    'Alfamart (081234567890)',
    'Indomaret (081234567890)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Selection'),
      ),
      body: Column(
        children: [
          Text(
            "Silahkan Bayar DI Salah Satu Nomor ini\nkonfirmasi ke no whatsapps \n088888888888",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Expanded(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(8.0),
              itemCount: paymentOptions.length,
              itemBuilder: (context, index) {
                String paymentOption = paymentOptions[index];
                String serviceName = paymentOption.split(' ')[0];
                String phoneNumber = paymentOption.split(' ')[1];
                return GestureDetector(
                  onTap: () {
                    // Handle payment option selection
                    String selectedPayment = paymentOption.split(' ')[0];
                    print('Selected payment: $selectedPayment');
                    print('Phone number: $phoneNumber');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue,
                            Colors.blueGrey,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            serviceName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            phoneNumber,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
              padding: EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(Routes.Dashboard);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Back To Home',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
