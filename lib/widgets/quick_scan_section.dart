import 'package:flutter/material.dart';

class QuickScanSection extends StatelessWidget {
  const QuickScanSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double boxSize = MediaQuery.of(context).size.width * 0.6;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0A2EFD), Color(0xFF00B4FF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Blue main box
            Container(
              width: boxSize,
              height: boxSize,
              decoration: BoxDecoration(
                color: const Color(0xFF0A2EFD),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
            ),

            // Background scanner image (faint)
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/icons/qr.png',
                  fit: BoxFit.cover,
                  color: Colors.white,
                  colorBlendMode: BlendMode.srcATop,
                ),
              ),
            ),

            // Orange corner painter
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: CustomPaint(painter: _CornerPainter()),
              ),
            ),

            // Center text
            const Center(
              child: Text(
                "Quick Scan\nTo Pay",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Orange corner painter (unchanged)
class _CornerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    const double corner = 25;

    // Top-left
    canvas.drawLine(Offset(0, 0), Offset(corner, 0), paint);
    canvas.drawLine(Offset(0, 0), Offset(0, corner), paint);

    // Top-right
    canvas.drawLine(
        Offset(size.width, 0), Offset(size.width - corner, 0), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(size.width, corner), paint);

    // Bottom-left
    canvas.drawLine(
        Offset(0, size.height), Offset(corner, size.height), paint);
    canvas.drawLine(
        Offset(0, size.height), Offset(0, size.height - corner), paint);

    // Bottom-right
    canvas.drawLine(
        Offset(size.width, size.height),
        Offset(size.width - corner, size.height),
        paint);
    canvas.drawLine(
        Offset(size.width, size.height),
        Offset(size.width, size.height - corner),
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
