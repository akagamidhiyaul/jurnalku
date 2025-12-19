import 'package:flutter/material.dart';
import 'profile.dart';
import 'explore.dart';
import 'habit_journal.dart';
import 'witness_request.dart';
import 'panduan_pengguna.dart';
import 'account_setting.dart';
import 'login.dart';

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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Habiburramdhana Lesmana',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F2533),
              ),
            ),
            SizedBox(height: 2),
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
            padding: const EdgeInsets.only(right: 16),
            child: _ProfileHeader(
              isMenuOpen: _isMenuOpen,
              onToggle: _toggleMenu,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Konten utama (misalnya kartu biru besar di sisi kiri)
          Container(
            color: const Color(0xFFF4F6FB),
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.all(24),
              height: 380,
              decoration: BoxDecoration(
                color: const Color(0xFF0C47A1),
                borderRadius: BorderRadius.circular(28),
              ),
            ),
          ),
          // Dropdown menu yang muncul di bawah app bar ketika tombol "V" ditekan
          if (_isMenuOpen)
            Positioned(
              top: 8,
              right: 16,
              child: Material(
                color: Colors.transparent,
                child: _Sidebar(
                  primaryItems: navItems,
                  secondaryItems: secondaryItems,
                  footerItems: bottomItems,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Sidebar extends StatelessWidget {
  const _Sidebar({
    required this.primaryItems,
    required this.secondaryItems,
    required this.footerItems,
  });

  final List<_NavItem> primaryItems;
  final List<_NavItem> secondaryItems;
  final List<_NavItem> footerItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 12,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...primaryItems.map(
            (item) => _SidebarTile(
              item: item,
              onTap: () {
                if (item.label == 'Profil') {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const ProfilePage(),
                    ),
                  );
                } else if (item.label == 'Jelajahi') {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const ExplorePage(),
                    ),
                  );
                }
              },
            ),
          ),
          const Divider(height: 32),
          ...secondaryItems.map(
            (item) => _SidebarTile(
              item: item,
              onTap: () {
                if (item.label == 'Jurnal Pembiasaan') {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const HabitJournalPage(),
                    ),
                  );
                } else if (item.label == 'Permintaan Saksi') {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const WitnessRequestPage(),
                    ),
                  );
                }
              },
            ),
          ),
          const Divider(height: 32),
          ...footerItems.map(
            (item) => _SidebarTile(
              item: item,
              onTap: () {
                if (item.label == 'Panduan Penggunaan') {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const PanduanPengguna(),
                    ),
                  );
                } else if (item.label == 'Pengaturan Akun') {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const AccountSettingsPage(),
                    ),
                  );
                } else if (item.label == 'Log Out') {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const Login(),
                    ),
                  );
                }
              },
            ),
          ),
          const Divider(height: 32),
          ...footerItems.map(
            (item) => _SidebarTile(item: item),
          ),
        ],
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({
    required this.isMenuOpen,
    required this.onToggle,
  });

  final bool isMenuOpen;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Row(
        children: [
          const CircleAvatar(
            radius: 18,
            backgroundColor: Color(0xFFDEE7FF),
            child: Icon(
              Icons.person,
              color: Color(0xFF4A79FF),
              size: 18,
            ),
          ),
          const SizedBox(width: 6),
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFE4E9F5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              isMenuOpen ? '▲' : 'V',
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF4A5366),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarTile extends StatelessWidget {
  const _SidebarTile({required this.item, this.onTap});

  final _NavItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(
                item.icon,
                color: const Color(0xFF7A8191),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  item.label,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF4A5366),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  const _NavItem({required this.icon, required this.label});

  final IconData icon;
  final String label;
}