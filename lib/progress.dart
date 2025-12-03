import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 253, 253),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                // backgroundColor: Colors.white,
                // Icon Home
                const Icon(Icons.house_outlined, size: 20),

                const SizedBox(width: 8),

                // Name + Class
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Dhiyaul Aulia Putra Amana",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        "PPLG XII-5",
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                  ),
                ),

                // Profile Picture
                const CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage("assets/dhiyaul.jpeg"), // ganti sesuai asset kamu
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              "Belajar",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            const Text(
              "Pantau perkembangan kompetensi dan materi pembelajaran Anda",
              style: TextStyle(fontSize: 13, color: Colors.black87),
            ),

            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "Wednesday, 3 December 2025",
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
              ),
            ),

            // (di bawah ini kamu bisa lanjutkan card Progress)
          ],
        ),
      ),
    );
  }
}
