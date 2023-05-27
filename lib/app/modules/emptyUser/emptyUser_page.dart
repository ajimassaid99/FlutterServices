import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:services/app/routes/app_pages.dart';
import './emptyUser_controller.dart';

class EmptyUserPage extends GetView<EmptyUserController> {
    
    const EmptyUserPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Anda Belum Login\nYuk Login Atau Register", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),textAlign: TextAlign.center,),
                  SizedBox(height: 20,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: (){Get.toNamed(Routes.Login);}, child: Text("Login")),
                      ElevatedButton(onPressed: (){Get.toNamed(Routes.Register);}, child: Text("Register")),
                    ],
                  )
                ]
                ),
            ),
        );
    }
}