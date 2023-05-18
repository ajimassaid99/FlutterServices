 import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/Register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 100,),
                  const Text("Personal Detail", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32, ),),
                  const SizedBox(height: 32.0),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value == '') {
                        return 'Email is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value=='') {
                        return 'Password is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Phone',
                    ),
                    validator: (value) {
                      if (value=='') {
                        return 'Phone is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _dateOfBirthController,
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                      labelText: 'Date of Birth (YYYY-MM-DD)',
                    ),
                    validator: (value) {
                      if (value=='') {
                        return 'Date of Birth is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _addressController,
                    decoration: const InputDecoration(
                      labelText: 'Address',
                    ),
                    validator: (value) {
                      if (value=='') {
                        return 'Address is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 100.0),
                 ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Do something with the form data
                      final email = _emailController.text;
                      final password = _passwordController.text;
                      final phone = _phoneController.text;
                      final dateOfBirth = _dateOfBirthController.text;
                      final address = _addressController.text;
                      await controller.register(email: email, password: password,phone: phone,dateOfBirth: dateOfBirth,address: address);

                      if(context.mounted){
                        _addressController.clear();
                        _dateOfBirthController.clear();
                        _emailController.clear();
                        _passwordController.clear();
                        _phoneController.clear();
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}