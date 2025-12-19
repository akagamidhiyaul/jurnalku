import 'package:flutter/material.dart';

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomHeader(),
            
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pengaturan Akun",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "Dashboard",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        " / ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[400],
                        ),
                      ),
                      const Text(
                        "Pengaturan Akun",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 20),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Informasi Profil",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1F2937),
                          ),
                        ),
                        
                        const SizedBox(height: 20),

                        // Bagian Foto Profil Besar & Icon Kamera
                        Center(
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 140,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                        width: 4,
                                      ),
                                      image: const DecorationImage(
                                        image: NetworkImage('https://i.pravatar.cc/300?img=11'), 
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF1E429F), // Biru tua
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 3),
                                      ),
                                      child: const Icon(
                                        Icons.camera_alt_outlined,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                "Klik untuk mengubah foto",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 30),

                        // Memanggil Widget TextField Custom (Ada di bagian bawah file ini)
                        const CustomTextField(
                          label: "Nama",
                          value: "Arga Surya Pratama",
                        ),
                        const CustomTextField(
                          label: "NIS",
                          value: "12309539",
                        ),
                        const CustomTextField(
                          label: "Rombel",
                          value: "PPLG XII-5",
                        ),
                        const CustomTextField(
                          label: "Rayon",
                          value: "Taj 4",
                        ),
                      ],
                    ),
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

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            Icon(Icons.home_outlined, color: Colors.grey[600], size: 28),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Arga Surya Pratama",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xFF1F2937),
                  ),
                ),
                Text(
                  "PPLG XII-5",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),
            const CircleAvatar(
              radius: 20,
              // GANTI DENGAN ASSET LOKAL JIKA ADA
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
            ),
          ],
        ),
      ),
    );
  }
}

// 2. Widget Custom Text Field (Input Read-Only)
class CustomTextField extends StatelessWidget {
  final String label;
  final String value;

  const CustomTextField({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF374151), // Dark grey
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6), // Warna abu-abu muda background input
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: TextField(
              controller: TextEditingController(text: value),
              readOnly: true, // Agar keyboard tidak muncul saat diklik
              style: const TextStyle(
                color: Color(0xFF111827), // Warna teks hampir hitam
                fontSize: 16,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}