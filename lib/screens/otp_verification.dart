import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:wavexpay/screens/home_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  bool _isVerifying = false;
  int _secondsRemaining = 30;
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _secondsRemaining = 30;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void _verifyOtp() async {
    setState(() => _isVerifying = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isVerifying = false);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("OTP Verified ✅")));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  void _resendOtp() async {
    // Call your resend OTP API here, for example:
    // await authService.sendOtp(phoneNumber);

    // Restart the timer to disable resend button for 30 seconds
    _startTimer();

    // Optionally, show a confirmation message
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('OTP resent successfully')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Verify OTP",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                            backgroundColor:  Colors.blue,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: _verifyOtp,
                          child: const Text(
                            "Verify OTP",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: _secondsRemaining == 0 ? _resendOtp : null,
                    child: Text(
                      _secondsRemaining > 0
                          ? 'Resend OTP ($_secondsRemaining sec)'
                          : 'Resend OTP',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
   
    );
  }
}
