import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart'; // Import the package

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileHeader(context),

              _buildQrCodeCard(context),

              _buildBankInfo(context),

              _buildActionButtons(context),

              _buildSettingsTitle(context),

              _buildSettingsList(context),

              _buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
          SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.all(2),
            child: CircleAvatar(
              radius: 24,
              child: Image.asset('assets/man.png'),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Prabal Maurya", 
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.verified, color: Colors.blue, size: 20),
                ],
              ),
          
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQrCodeCard(BuildContext context) {
    const upiId = "229292222@wavexpay"; // Replace with user data

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: Colors.blue.shade300, width: 3),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            // The QR Code
            QrImageView(
              data: 'upi://pay?pa=$upiId&pn=Prabal%20Maurya', // UPI deep link
              version: QrVersions.auto,
              size: 200.0,
            ),
            const SizedBox(height: 16),
            // UPI ID
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    upiId,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(Icons.copy, size: 18, color: Colors.grey.shade700),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBankInfo(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.account_balance_outlined),
      title: const Text(
        "State Bank of India - 2828",
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      trailing: TextButton(
        onPressed: () {},
        child: const Text(
          "Change Bank",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _actionButton(icon: Icons.share_outlined, label: "Share QR"),
          _actionButton(icon: Icons.download_outlined, label: "Save QR"),
          _actionButton(
            icon: Icons.add_to_home_screen_outlined,
            label: "Add to Home...",
          ),
        ],
      ),
    );
  }

  Widget _actionButton({required IconData icon, required String label}) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue.shade700, size: 28),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildSettingsTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Settings",
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          Icon(Icons.search, color: Colors.grey.shade700, size: 28),
        ],
      ),
    );
  }

  Widget _buildSettingsList(BuildContext context) {
    // A helper to create the list tiles
    Widget settingTile({
      required IconData icon,
      required String title,
      required String subtitle,
      Widget? trailing,
    }) {
      return ListTile(
        leading: Icon(icon, color: Colors.grey.shade600),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
        trailing:
            trailing ??
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {},
      );
    }

    return Column(
      children: [
        settingTile(
          icon: Icons.settings_outlined,
          title: "UPI & Payment Settings",
          subtitle: "UPI Pin, Bank Accounts & more",
        ),
        settingTile(
          icon: Icons.autorenew_outlined,
          title: "Automatic Payments",
          subtitle: "Manage all your UPI Automatic Payments",
        ),
        settingTile(
          icon: Icons.receipt_long_outlined,
          title: "Orders & Bookings",
          subtitle: "Recharge, Travel & Others",
        ),
        settingTile(
          icon: Icons.person_outline,
          title: "Profile",
          subtitle: "Privacy, Notification & Language",
        ),
        settingTile(
          icon: Icons.help_outline,
          title: "Help & Support",
          subtitle: "Customer Support, Your Queries & FAQs",
        ),
        settingTile(
          icon: Icons.card_giftcard_outlined,
          title: "Refer & Win",
          subtitle: "Invite your friend and Win Cashback upto ₹125",
        ),
        // Special tile with a button
        settingTile(
          icon: Icons.security_outlined,
          title: "Paytm Security Shield",
          subtitle: "Protect your account",
          trailing: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text("Activate"),
          ),
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          // You would use an Image.asset here for the Paytm logo
          Text(
            "WaveXPay",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900,
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Made By India"),
              // Add the Indian flag icon/image here
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            "Terms & Conditions, Privacy policy, Grievance, Redressal Mechanism, See all policies",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          const Text(
            "v1.0.0", // Replace with your app version
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
