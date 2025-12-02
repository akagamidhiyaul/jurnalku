import 'package:flutter/material.dart';

class HabitJournalPage extends StatelessWidget {
  const HabitJournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _TopBar(),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      _Header(),
                      SizedBox(height: 16),
                      _JournalCard(),
                      SizedBox(height: 24),
                    ],
                  ),
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
          TextButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFF0D6EFD),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            icon: const Icon(Icons.arrow_back, size: 18),
            label: const Text(
              'Kembali',
              style: TextStyle(fontSize: 14),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Jurnal Pembiasaan',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2533),
          ),
        ),
        SizedBox(height: 4),
        Text(
          'DESEMBER • 2025',
          style: TextStyle(
            fontSize: 12,
            letterSpacing: 1.1,
            color: Color(0xFF9AA2B1),
          ),
        ),
      ],
    );
  }
}

class _JournalCard extends StatelessWidget {
  const _JournalCard();

  @override
  Widget build(BuildContext context) {
    final categories = [
      'Kesehatan dan Keselamatan Kerja',
      'Keselamatan',
      'Karakter',
    ];

    final habitsByCategory = <String, List<String>>{
      'Kesehatan dan Keselamatan Kerja': [
        'Pencahayaan dan sirkulasi udara pada ruang kerja baik.',
        'Duduk menggunakan meja dan kursi yang nyaman.',
        'Punggung dan leher tegak, tidak bungkuk.',
        'Posisi siku sejajar dengan meja/keyboard.',
        'Posisi kaki tidak menggantung dan tidak menekuk.',
        'Posisi layar sejajar dengan mata.',
        'Melihat ke arah jauh setiap 30 menit melihat layar.',
        'Melakukan stretching setiap 1 jam duduk.',
        'Minum 200 ml (segelas) air mineral setiap 2 jam.',
      ],
      'Keselamatan': [
        'Tidak ada benda berbahaya di dekat peralatan kerja.',
        'Kabel tertata rapi dan tidak terbuka.',
        'Stop kontak aman dan tidak terbuka.',
        'Peralatan kerja dirapikan kembali setelah digunakan.',
      ],
      'Karakter': [
        'Berdoa sebelum dan sesudah bekerja.',
        'Bagi muslim, melaksanakan sholat tepat waktu.',
        'Berkomitmen pada pekerjaan/tugas.',
        'Berpartisipasi dalam tim dan membantu teman.',
        'Menghormati rekan kerja.',
        'Terbiasa Wajib Ngulik untuk meningkatkan pemahaman.',
      ],
    };

    final days = List.generate(10, (i) => '0${i + 1}'); // contoh 10 hari

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header kartu
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
            child: Row(
              children: const [
                CircleAvatar(
                  radius: 14,
                  backgroundColor: Color(0xFFE4E9F5),
                  child: Text(
                    'A',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1F2533),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pembiasaan Harian',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1F2533),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Jurnal keseharian selama minggu produktif',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF9AA2B1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // tabel
          SizedBox(
            height: 900,
            child: Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    _TableHeader(days: days),
                    const Divider(height: 1),
                    ...categories.expand(
                      (cat) sync* {
                        // kategori row
                        yield _CategoryRow(title: cat);
                        for (final h in habitsByCategory[cat]!) {
                          yield _HabitRow(
                            title: h,
                            days: days.length,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TableHeader extends StatelessWidget {
  const _TableHeader({required this.days});

  final List<String> days;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          const SizedBox(
            width: 260,
            child: Text(
              'PEMBIASAAN',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF7A8191),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'DESEMBER 2025',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF7A8191),
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: days
                    .map(
                      (d) => SizedBox(
                        width: 40,
                        child: Center(
                          child: Text(
                            d,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Color(0xFF9AA2B1),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CategoryRow extends StatelessWidget {
  const _CategoryRow({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260 + 12 + 40 * 10,
      color: const Color(0xFFF5F7FB),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Color(0xFF7A8191),
        ),
      ),
    );
  }
}

class _HabitRow extends StatelessWidget {
  const _HabitRow({required this.title, required this.days});

  final String title;
  final int days;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFE4E9F2), width: 0.7),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 260,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF4A5366),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Row(
            children: List.generate(
              days,
              (i) => SizedBox(
                width: 40,
                height: 24,
                child: const Center(
                  child: _CircleOption(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleOption extends StatelessWidget {
  const _CircleOption();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFFD0D7E2),
          width: 1.2,
        ),
      ),
    );
  }
}


