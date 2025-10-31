import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  bool _isVerifying = false;

  void _verifyOtp() async {
    setState(() => _isVerifying = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isVerifying = false);

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("OTP Verified ✅")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4))
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Verify OTP",
                    style: TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  OtpTextField(
                    numberOfFields: 6,
                    borderColor: Colors.black26,
                    focusedBorderColor: Colors.indigo,
                    showFieldAsBox: true,
                    onSubmit: (otp) => _verifyOtp(),
                  ),
                  const SizedBox(height: 20),
                  _isVerifying
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2575FC),
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: _verifyOtp,
                          child: const Text("Verify OTP",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white)),
                        ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Resend OTP"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}