import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DashboardController extends GetxController { 
  @override
  void onInit() {
    fetchUser(); 
  }
  
RxList<Map<String, dynamic>> User = <Map<String, dynamic>>[].obs;
  
  void fetchUser()async{
    final prefs = await SharedPreferences.getInstance();
    final User_id =await prefs.getInt('userId');

    User.value =[];

    final List response = await Supabase.instance.client
        .from('user')
        .select('*')
        .eq('id', '16');
    
    print(response);
    User..addAll(response.cast<Map<String, dynamic>>());
  }
  
}