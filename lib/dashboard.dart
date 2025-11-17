import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),//Color(0xFF0175C2), 
        elevation: 0,
        title: Row(
          children: const [
            Icon(Icons.book, size: 20),
            SizedBox(width: 6),
            Text(
              "Jurnalku",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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