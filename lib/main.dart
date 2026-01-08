import 'package:flutter/material.dart';
import 'dart:math'; // ต้อง import เพื่อใช้ Random()

void main() {
  runApp(const MaterialApp(home: Scaffold(body: DiceApp())));
}

class DiceApp extends StatefulWidget {
  const DiceApp({super.key});

  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  // กำหนดตัวแปรสำหรับเก็บชื่อภาพลูกเต๋าที่แสดงผลอยู่
  var activeDice = 'assets/images/dice-1.png';

  // ฟังก์ชันสุ่มตัวเลขและเปลี่ยนค่าสถานะ (State) [cite: 219]
  void rollDice() {
    setState(() {
      // สุ่มเลข 1 ถึง 6
      var dice = Random().nextInt(6) + 1;
      // อัปเดต Path ของรูปภาพตามตัวเลขที่สุ่มได้
      activeDice = 'assets/images/dice-$dice.png';
      print(activeDice); // แสดงผลใน Console เพื่อตรวจสอบ
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // การตั้งค่าพื้นหลังแบบ Gradient ตามตัวอย่างในเอกสาร [cite: 205, 207]
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Colors.blue, Colors.green],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // ใช้ขนาดเท่าที่จำเป็น [cite: 155]
          children: [
            // แสดงรูปภาพลูกเต๋า
            Image.asset(activeDice, width: 200),
            const SizedBox(height: 20),
            // ปุ่มกดสำหรับสุ่มลูกเต๋า [cite: 208]
            TextButton(
              onPressed: rollDice, // เรียกใช้ฟังก์ชันสุ่ม [cite: 215]
              style: TextButton.styleFrom(
                backgroundColor: Colors.white, // พื้นหลังปุ่มสีขาว [cite: 211]
                padding: const EdgeInsets.all(16), // ระยะห่างภายใน [cite: 212]
              ),
              child: const Text(
                "Roll the Dice", // ข้อความบนปุ่ม [cite: 216]
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
