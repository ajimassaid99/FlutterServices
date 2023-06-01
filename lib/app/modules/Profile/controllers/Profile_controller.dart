import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileController extends GetxController {
  RxString profileImagePath = ''.obs;
  RxString name = ''.obs;
  RxString phoneNumber = ''.obs;
  RxString email = ''.obs;
  RxString address = ''.obs;
  RxString birthPlace = ''.obs;
  RxString birthDate = ''.obs;

  @override
  void onInit() {
    setProfileImagePath();
    loadProfileData();
  }

  void setProfileImagePath() async{
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('img');
    profileImagePath.value = imagePath!;
    print('sudah');
  }


  void loadProfileData() async{
    final prefs = await SharedPreferences.getInstance();
     final userId = int.parse(prefs.getString('userId')!);
    final response = await Supabase.instance.client
        .from('user')
        .select('*')
        .eq('id', userId);
        print(response);
    final user = response[0];
    name.value = user['nama'];
    email.value = user['email'];
    phoneNumber.value = user['phone'];
    address.value = user['alamat'];
    birthDate.value = user['tanggal_lahir'];
    birthPlace.value = user['tempat lahir'];
  }

}