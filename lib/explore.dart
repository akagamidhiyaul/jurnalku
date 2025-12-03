import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),
      body: SafeArea(
        child: Column(
          children: [
            _TopBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    _HeroSection(),
                    SizedBox(height: 24),
                    _StudentGridSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          const Text(
            'Jurnalku',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1F2533),
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFF0D6EFD),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: const Text(
              'Dashboard',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF0C47A1),
        image: DecorationImage(
          image: AssetImage('assets/images/hero_placeholder.jpg'),
          fit: BoxFit.cover,
          opacity: 0.4,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'Direktori Siswa',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Temukan dan jelajahi profil siswa SMK Wikrama Bogor',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            _SearchBar(),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 580,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          const Icon(Icons.search, color: Color(0xFF9AA2B1)),
          const SizedBox(width: 8),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari nama siswa, NIS, atau rombel...',
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          Container(
            height: 44,
            width: 80,
            decoration: const BoxDecoration(
              color: Color(0xFF0D6EFD),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Cari',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StudentGridSection extends StatelessWidget {
  const _StudentGridSection();

  @override
  Widget build(BuildContext context) {
    final students = List.generate(
      12,
      (index) => _Student(
        name: 'Nama Siswa ${index + 1}',
        nis: '1230${index.toString().padLeft(3, '0')}',
        rombel: 'PPLG XII-${(index % 5) + 1}',
        rayon: 'Wk ${(index % 5) + 1}',
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Menampilkan 1 - 12 dari 538 siswa',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF9AA2B1),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: students
                .map(
                  (s) => SizedBox(
                    width: 220,
                    child: _StudentCard(student: s),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 16),
          const _Pagination(),
        ],
      ),
    );
  }
}

class _Student {
  final String name;
  final String nis;
  final String rombel;
  final String rayon;

  const _Student({
    required this.name,
    required this.nis,
    required this.rombel,
    required this.rayon,
  });
}

class _StudentCard extends StatelessWidget {
  const _StudentCard({required this.student});

  final _Student student;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xFFDEE7FF),
              child: Icon(
                Icons.person,
                size: 22,
                color: Color(0xFF4A79FF),
              ),
            ),
            title: Text(
              student.name,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F2533),
              ),
            ),
            subtitle: Text(
              '${student.nis} | ${student.rombel} | ${student.rayon}',
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF7A8191),
              ),
            ),
          ),
          const Divider(height: 1),
          Row(
            children: [
              const SizedBox(width: 12),
              const Icon(Icons.work_outline,
                  size: 14, color: Color(0xFF9AA2B1)),
              const SizedBox(width: 4),
              const Text(
                '0 Portofolio',
                style: TextStyle(
                  fontSize: 11,
                  color: Color(0xFF9AA2B1),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.workspace_premium_outlined,
                  size: 14, color: Color(0xFF9AA2B1)),
              const SizedBox(width: 4),
              const Text(
                '0 Sertifikat',
                style: TextStyle(
                  fontSize: 11,
                  color: Color(0xFF9AA2B1),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF0D6EFD),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
              ),
              child: const Text(
                'Lihat Detail',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Pagination extends StatelessWidget {
  const _Pagination();

  @override
  Widget build(BuildContext context) {
    Widget pageButton(String text, {bool active = false}) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: active ? const Color(0xFF0D6EFD) : Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: const Color(0xFFD0D7E2)),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 11,
            color: active ? Colors.white : const Color(0xFF4A5366),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Row(
          children: [
            pageButton('<'),
            pageButton('1', active: true),
            pageButton('2'),
            pageButton('3'),
            pageButton('4'),
            pageButton('5'),
            const Text('...'),
            pageButton('44'),
            pageButton('45'),
            pageButton('>'),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'Showing 1 to 12 of 538 results',
          style: TextStyle(
            fontSize: 11,
            color: Color(0xFF9AA2B1),
          ),
        ),
      ],
    );
  }
}


