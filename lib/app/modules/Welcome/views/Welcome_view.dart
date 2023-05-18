import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:services/app/routes/app_pages.dart';

import '../controllers/Welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SizedBox(
        width: MediaQuery.of(context).size.width,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50,),
            const Text(
              'WELCOME',
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
            ),
            const Text(
              '2PK SERVICE',
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
            ),
             Image.asset(
              'assets/logo.png',
            ),
            const SizedBox(height: 60,),
            const Text(
              'Fast',
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
            ),
            const Text(
              'Clean',
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
            ),
            const Text(
              'SatisFactory',
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 80,),
            ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.Dashboard);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: const SizedBox(
                    width: 250,
                    child: Text(
                    'Lewati',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                  Navigator.pushNamed(context, Routes.Register);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  child: const SizedBox(
                    width: 250,
                    child: Text(
                    'Sing Up',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.pushNamed(context, Routes.Login);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: const SizedBox(
                    width: 250,
                    child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
