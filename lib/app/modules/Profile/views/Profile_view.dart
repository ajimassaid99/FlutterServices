import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';
import '../controllers/Profile_controller.dart';

// ignore: must_be_immutable
class ProfileView extends GetView<ProfileController> {
  ProfileView({super.key});

  final ImagePicker _imagePicker = ImagePicker();
  late SharedPreferences _prefs;
  late String _profileImagePath = controller.profileImagePath.value;

  Future<void> pickImage() async {
    final PickedFile? pickedImage =
        await _imagePicker.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      controller.profileImagePath.value = pickedImage.path;
      await _prefs.setString('img', pickedImage.path);
      controller.setProfileImagePath();
    }
  }

  void get() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }

  @override
  Widget build(BuildContext context) {
    get();
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: pickImage,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage:
                          controller.profileImagePath.value.isNotEmpty
                              ? FileImage(File(_profileImagePath))
                              : null,
                      child: controller.profileImagePath.value.isNotEmpty
                          ? null
                          : Icon(
                              Icons.person,
                              size: 80,
                            ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.camera_alt,
                          size: 16,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                controller.name.value,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(controller.phoneNumber.value),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text(controller.email.value),
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text(controller.address.value),
              ),
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text('Tempat Tanggal Lahir'),
                subtitle: Text(
                    '${controller.birthPlace.value},${controller.birthDate.value}'),
              ),
              SizedBox(height: 64,),
              Padding(
                padding: EdgeInsets.all(15),
                child: ElevatedButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.remove('userId');
                    if (context.mounted) {
                      Get.snackbar("Success", "Berhasil Logout");
                      Get.offAllNamed(Routes.Welcome);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: SizedBox(
                      width: double.infinity - 2 * 15,
                      child: Text(
                        'Logout',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        })),
      ),
    );
  }
}
