import 'package:flutter/material.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
         gradient: LinearGradient(
          colors: [Color(0xFF0A2EFD), Color(0xFF0057FF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
    
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(Icons.person, color: Colors.blueAccent),
                ),
                const SizedBox(width: 10),
             
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Location",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "B-297, New Ashok Nagar",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Right Section (Icons)
            Row(
              children: const [
                Icon(Icons.search, color: Colors.white),
                SizedBox(width: 12),
                Icon(Icons.account_balance_wallet_outlined, color: Colors.white),
                SizedBox(width: 12),
                Icon(Icons.notifications_none, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


