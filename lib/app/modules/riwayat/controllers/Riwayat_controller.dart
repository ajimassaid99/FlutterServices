import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RiwayatController extends GetxController {
  
RxList<Map<String, dynamic>> Booking = <Map<String, dynamic>>[].obs;
@override
  void onInit() {
    super.onInit();    
    fetchBooking(); 
  }

void fetchBooking() async {
    Booking.value = [];
    final prefs = await SharedPreferences.getInstance();
    final User_id =await prefs.getString('userId');
    final List response = await Supabase.instance.client
        .from('booking')
        .select('*,products(*),user(*)')
        .eq('user_id',User_id);
    
    Booking.addAll(response.cast<Map<String, dynamic>>());
  }
}