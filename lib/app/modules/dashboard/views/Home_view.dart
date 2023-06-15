import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/app/modules/Profile/views/Profile_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../emptyUser/emptyUser_page.dart';
import '../../riwayat/views/riwayat_view.dart';
import 'Dasboard_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  RxString userId = ''.obs;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    if (this.mounted) {
      userId.value = await prefs.getString('userId') ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          // Widget untuk halaman Dashboard
          DashboardWidget(),
          // Widget untuk halaman Riwayat
          Obx(() {
            if (userId.value.isEmpty) {
              return const EmptyUserPage();
            } else {
              
              return RiwayatView();
            }
          }),
          Obx(() {
            if ( userId.value.isEmpty) {
              return const EmptyUserPage();
            } else {
              return ProfileView();
            }
          }),
          // Widget untuk halaman Profil
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
