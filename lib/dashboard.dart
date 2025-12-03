import 'package:flutter/material.dart';
import 'profile.dart';
import 'explore.dart';
import 'habit_journal.dart';
import 'witness_request.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _isMenuOpen = false;

  void _toggleMenu() => setState(() => _isMenuOpen = !_isMenuOpen);

  @override
  Widget build(BuildContext context) {
    final List<_NavItem> navItems = [
      _NavItem(icon: Icons.home_outlined, label: 'Dashboard'),
      _NavItem(icon: Icons.person_outline, label: 'Profil'),
      _NavItem(icon: Icons.explore_outlined, label: 'Jelajahi'),
    ];

    final List<_NavItem> secondaryItems = [
      _NavItem(icon: Icons.menu_book_outlined, label: 'Jurnal Pembiasaan'),
      _NavItem(icon: Icons.person_add_alt_outlined, label: 'Permintaan Saksi'),
      _NavItem(icon: Icons.bar_chart_outlined, label: 'Progress'),
      _NavItem(icon: Icons.warning_amber_outlined, label: 'Catatan Sikap'),
    ];

    final List<_NavItem> bottomItems = [
      _NavItem(icon: Icons.menu_book_outlined, label: 'Panduan Penggunaan'),
      _NavItem(icon: Icons.settings_outlined, label: 'Pengaturan Akun'),
      _NavItem(icon: Icons.logout_outlined, label: 'Log Out'),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),//Color(0xFF0175C2), 
        elevation: 0,
        title: Row(
          children: const [
            Icon(Icons.book, size: 20),
            SizedBox(width: 6),
            Text(
              'PPLG XII-5',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF7A8191),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.only(right: 10),
          child: ElevatedButton(
            onPressed: () {},
             style: ElevatedButton.styleFrom(
          backgroundColor:  Color(0xFF0175C2),
          padding:  EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
            child: Text("Login", style: TextStyle(color: Colors.white),),
          ),
          )
          ],
      )
    );
  }
}

class _NavItem {
  const _NavItem({required this.icon, required this.label});

  final IconData icon;
  final String label;
}
