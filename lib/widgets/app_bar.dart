import 'package:flutter/material.dart';
import 'package:wavexpay/screens/notification_screen.dart';
import 'package:wavexpay/screens/search_screen.dart';
import 'package:wavexpay/screens/sidebar_screen.dart';
import 'package:wavexpay/screens/wallet_screens.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({super.key});

  void openProfileDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Profile Avatar
        GestureDetector(
          onTap: () => openDrawer(context),
       
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/man.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        const SizedBox(width: 10),

        // Location text
        const Text(
          "Lucknow",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),

        const Spacer(),

        // Action icons
        _AppIcon(
          icon: Icons.search,
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()))
        ),
        _AppIcon(
          icon: Icons.account_balance_wallet_outlined,
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const WalletScreen()))
       
        ),
        _AppIcon(
          icon: Icons.notifications_none,
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen()))
      
        ),
      ],
    );
  }
}
void openDrawer(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true, 
    barrierLabel: 'Profile Drawer',
    barrierColor: Colors.black, 
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Align(
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: 0.85, 
          child: Material(
            elevation: 12,
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
            clipBehavior: Clip.antiAlias,
            child: const ProfileSettingsScreen(),
          ),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      // 👇 smooth slide-in transition
      final offsetAnimation = Tween<Offset>(
        begin: const Offset(-1.0, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic));
      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}

// Reusable icon widget for clean spacing
class _AppIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _AppIcon({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      iconSize: 26,
      splashRadius: 22,
      color: Colors.white,
      onPressed: onTap,
    );
  }
}
