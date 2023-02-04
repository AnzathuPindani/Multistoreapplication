import 'package:flutter/material.dart';
import 'package:siopa/app/screen/main_screens/costumer_screen/category.dart';
import 'package:siopa/app/screen/main_screens/costumer_screen/home.dart';
import 'package:siopa/app/screen/main_screens/costumer_screen/stores.dart';
import 'package:siopa/app/screen/main_screens/supplier_screen.dart/dashboard.dart';
import 'package:siopa/app/screen/main_screens/supplier_screen.dart/uploads.dart';
import 'package:siopa/app/utils/colors.dart';

class SupplierHomeScreen extends StatefulWidget {
  const SupplierHomeScreen({super.key});

  @override
  State<SupplierHomeScreen> createState() => _SupplierHomeScreenState();
}

class _SupplierHomeScreenState extends State<SupplierHomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _tabs = const [
    DashboardScreen(),
    CategoryScreen(),
    StoresScreen(),
    UploadsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        unselectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: xGreen,
        unselectedItemColor: xBlue,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: "Stores",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload),
            label: "Upload",
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
