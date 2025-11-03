import 'package:flutter/material.dart';
import 'package:wavexpay/screens/scan_screen.dart';

class Scanner extends StatelessWidget {
  const Scanner({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QRScannerScreen()),
        );
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Text(
            "Quick Scan\nTo Pay",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
          ),
          Icon(
            Icons.qr_code_scanner,
            color: Colors.white.withAlpha(30),
            size: 260,
          ),
          // The custom painter for the corners
          SizedBox(
            width: 260,
            height: 260,
            child: CustomPaint(
              painter: CornerPainter(
                cornerColor: Colors.white,
                strokeWidth: 4,
                radius: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CornerPainter extends CustomPainter {
  final Color cornerColor;
  final double strokeWidth;
  final double radius;

  CornerPainter({
    this.cornerColor = Colors.white,
    this.strokeWidth = 4.0,
    this.radius = 20.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = cornerColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));

   

    // Top-left corner
    canvas.drawArc(
      Rect.fromLTWH(rrect.left, rrect.top, radius * 2, radius * 2),
      -1.57 * 2, // Start angle (pointing up)
      1.57, // Sweep angle (90 degrees clockwise)
      false,
      paint,
    );

    // Top-right corner
    canvas.drawArc(
      Rect.fromLTWH(
        rrect.right - radius * 2,
        rrect.top,
        radius * 2,
        radius * 2,
      ),
      -1.57, // Start angle (pointing left)
      1.57, // Sweep angle (90 degrees clockwise)
      false,
      paint,
    );

    // Bottom-left corner
    canvas.drawArc(
      Rect.fromLTWH(
        rrect.left,
        rrect.bottom - radius * 2,
        radius * 2,
        radius * 2,
      ),
      -1.57 * 3, // Start angle (pointing right)
      1.57, // Sweep angle (90 degrees clockwise)
      false,
      paint,
    );

    // Bottom-right corner
    canvas.drawArc(
      Rect.fromLTWH(
        rrect.right - radius * 2,
        rrect.bottom - radius * 2,
        radius * 2,
        radius * 2,
      ),
      0, // Start angle (pointing down)
      1.57, // Sweep angle (90 degrees clockwise)
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
