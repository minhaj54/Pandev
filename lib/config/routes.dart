import 'package:flutter/material.dart';

import '../screens/doctor/appointment_screen.dart';
import '../screens/doctor/doctors_list_screen.dart';
import '../screens/doctor/videocall_screen.dart';
import '../screens/donation/donation_screen.dart';
import '../screens/forum/forum_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/shop/products_screen.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => HomeScreen(),
    '/doctors': (context) => DoctorsListScreen(),
    '/products': (context) => ProductsScreen(),
    '/donation': (context) => DonationScreen(),
    '/forum': (context) => ForumScreen(),
    '/appointment-booking': (context) => AppointmentBookingScreen(),
    '/video-call': (context) => VideoCallScreen(),
    // '/cart': (context) => CartScreen(),
  };
}
