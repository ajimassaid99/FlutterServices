import 'package:flutter/material.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://bmbfeiqnadzbpwcffjmz.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJtYmZlaXFuYWR6YnB3Y2Zmam16Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODM4OTYxODUsImV4cCI6MTk5OTQ3MjE4NX0.OdS4LYf-96UAiYuRBJpovuCRqQz09sLOEE_ORz8ylWw",
  );
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
