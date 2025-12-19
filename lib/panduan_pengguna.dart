import 'package:flutter/material.dart';
import 'package:jurnalku_forever/panduan_detail.dart';

class PanduanPengguna extends StatelessWidget {
  const PanduanPengguna({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: Colors.black12, width: 0.6),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.home_outlined, size: 18, color: Colors.black45),
                  SizedBox(width: 6),
                  Icon(Icons.chevron_right, size: 18, color: Colors.black38),
                  SizedBox(width: 6),
                  Builder(
                    builder: (context) {
                      double width = MediaQuery.of(context).size.width;
                      // kalau layar kecil, tulisan nya di sembunyiin
                      if (width < 500) {
                        return SizedBox.shrink();
                      }
                      return Text(
                        "Panduan Penggunaan",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Arga Surya Pratama",
                        style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "PPLG XII-5",
                        style: TextStyle(fontSize: 10.5, color: Colors.black54),
                      ),
                    ],
                  ),
                  SizedBox(width: 8),
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage("assets/images/profile.jpg"),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 20,
                    color: Colors.black54,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 26, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.menu_book_outlined,
                  color: Color.fromARGB(255, 13, 73, 176),
                  size: 26,
                ),
                SizedBox(width: 10),
                Text(
                  "Panduan Penggunaan",
                  style: TextStyle(
                    fontSize: 22,
                    color: Color.fromARGB(255, 13, 73, 176),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Selamat datang di panduan penggunaan aplikasi Jurnalku. Panduan ini akan membantu Anda memahami cara menggunakan fitur-fitur yang tersedia dengan optimal.",
              style: TextStyle(fontSize: 14, height: 1.4),
            ),
            SizedBox(height: 30),
            Text(
              "Umum",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            Divider(color: Colors.grey.shade300),
            SizedBox(height: 12),
            _menuItem(
              context,
              icon: Icons.document_scanner_outlined,
              title: "Unggah Profile",
              subtitle: "Panduan untuk mengunggah profile pengguna",
            ),
            _menuItem(
              context,
              icon: Icons.document_scanner_outlined,
              title: "Ganti Password",
              subtitle: "Panduan untuk mengganti password pengguna",
            ),
            SizedBox(height: 25),
            Text(
              "Untuk Siswa",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            Divider(color: Colors.grey.shade300),
            SizedBox(height: 12),
            _menuItem(
              context,
              icon: Icons.document_scanner_outlined,
              title: "Mengisi Jurnal",
              subtitle: "Panduan untuk mengisi kegiatan sehari - hari",
            ),
            _menuItem(
              context,
              icon: Icons.document_scanner_outlined,
              title: "Kelengkapan Profile",
              subtitle: "Panduan untuk melengkapi profile",
            ),
            _menuItem(
              context,
              icon: Icons.folder_shared_outlined,
              title: "Mengelola Portfolio",
              subtitle: "Panduan untuk menambah, edit, dan hapus portfolio",
            ),
            _menuItem(
              context,
              icon: Icons.check_circle_outlined,
              title: "Mengelola Sertifikat",
              subtitle: "Panduan untuk menambah, edit, dan hapus sertifikat",
            ),
            _menuItem(
              context,
              icon: Icons.error_outlined,
              title: "Catatan Sikap Saya",
              subtitle: "Panduan untuk melihat dan memahami catatan sikap",
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailPage()),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 14),
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black12, width: 0.8),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFE5EEFF),
                borderRadius: BorderRadius.circular(12),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black12,
                //     blurRadius: 6,
                //     offset: Offset(0, 3),
                //   ),
                // ],
              ),
              child: Icon(
                icon,
                color: Color.fromARGB(255, 13, 73, 176),
                size: 22,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 13, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}