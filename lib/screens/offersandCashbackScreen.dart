
import 'package:flutter/material.dart';
class Offersandcashbackscreen extends StatelessWidget {
  const Offersandcashbackscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
                title: Text('Offers & Cashback', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),


       
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Banner - Assured Cashback
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF00BAF2), Color(0xFF00D9F5)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Image.network(
                    'https://cdn-icons-png.flaticon.com/512/2331/2331966.png',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Get Assured Cashback up to Rs. 100',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '1st · 12h · 24th · 72h',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
                ],
              ),
            ),

            // Gold Coin Banner
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF002D72), Color(0xFF003D8F)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: -10,
                    top: -10,
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/3589/3589067.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Positioned(
                    right: -10,
                    top: -10,
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/3589/3589067.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          'Get 1 Gold Coin on',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'every ₹100 payment',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFDB913),
                            foregroundColor: const Color(0xFF002D72),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'Start Earning Now',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Stats Row
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatItem('₹4', 'Cashback Won', Colors.orange),
                  _buildStatItem('0', 'Gold Coins', const Color(0xFFFDB913)),
                  _buildStatItem('0', 'My Vouchers', Colors.blue),
                ],
              ),
            ),

            // Scratch & Claim Rewards
            _buildSectionHeader('SCRATCH & CLAIM YOUR REWARDS', () {}),
            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  _buildScratchCard('Cashback', const Color(0xFF00BAF2)),
                  _buildScratchCard('Gold Coins', const Color(0xFFFDB913)),
                  _buildScratchCard('Special', const Color(0xFF002D72)),
                  _buildScratchCard('Bonus', const Color(0xFFFF6B35)),
                ],
              ),
            ),

            // Claim Brand Deals
            _buildSectionHeader('CLAIM BRAND DEALS', () {}),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  _buildBrandDeal('Get Flat 30% Off\non Selected Items', const Color(0xFF003D8F)),
                  _buildBrandDeal('Get Flat 40% Off\non Items', const Color(0xFF6B2D5C)),
                  _buildBrandDeal('Flat ₹100 off on\nFood', const Color(0xFFE63946)),
                  _buildBrandDeal('Buy 2 Get 1\nFree', const Color(0xFF2A9D8F)),
                ],
              ),
            ),

            // Play & Win Section
            _buildSectionHeader('PLAY & WIN', () {}),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildPlayWinCard('Play Jackpot', Icons.card_giftcard, const Color(0xFF00BAF2)),
                  _buildPlayWinCard('Spin & Win', Icons.loop, const Color(0xFF6B2D5C)),
                  _buildPlayWinCard('Smash & Win', Icons.celebration, Colors.orange),
                  _buildPlayWinCard('Daily Surprise', Icons.redeem, Colors.red),
                ],
              ),
            ),

            // Pending Cashback Banner
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFE3F2FD),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.account_balance_wallet, color: Color(0xFF002D72)),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      "You've pending Cashback Points\nUse to get Paytm Gold Voucher",
                      style: TextStyle(fontSize: 14, color: Color(0xFF002D72)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00BAF2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Redeem Now'),
                  ),
                ],
              ),
            ),

            // Gift Cards Offers
            _buildSectionHeader('GIFT CARDS OFFERS', () {}),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  _buildGiftCard('5% Off', Colors.blue),
                  _buildGiftCard('15% Off', const Color(0xFF002D72)),
                  _buildGiftCard('40% Off', Colors.purple),
                  _buildGiftCard('4% Off', Colors.green),
                ],
              ),
            ),

            // Save with Paytm Section
            _buildSectionHeader('SAVE WITH PAYTM', () {}),
            _buildListTile('Paytm Exclusive Offers', 'Offers specially curated for You', Icons.local_offer),
            _buildListTile('Offers for Online Shopping', 'Pay using Paytm and get amazing offers', Icons.shopping_bag),

            // Spin and Win
            _buildSectionHeader('SPIN AND WIN', () {}),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  _buildSpinCard('Win Lenskart\nGold Max Membership', Colors.red),
                  _buildSpinCard('Win Flat ₹1000 off\non GIVIA', Colors.orange),
                  _buildSpinCard('Win ₹150 on\nAmazon Pay', Colors.blue),
                ],
              ),
            ),

            // Explore All Offers
            _buildSectionHeader('EXPLORE ALL OFFERS', () {}),
            
            // Filter Chips
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Wrap(
                spacing: 8,
                children: [
                  _buildFilterChip('All'),
                  _buildFilterChip('Products at Rs.1'),
                  _buildFilterChip('Fashion'),
                  _buildFilterChip('Beauty'),
                  _buildFilterChip('Food'),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Category Filters
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(child: _buildDropdown('Brand: All')),
                  const SizedBox(width: 8),
                  Expanded(child: _buildDropdown('Category: All')),
                  const SizedBox(width: 8),
                  Expanded(child: _buildDropdown('Subcategory: All')),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Offers Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: _buildOfferCard('Upto Rs.300 OFF\non Swiggy', 'Swiggy', '82% Off', Colors.orange)),
                      const SizedBox(width: 12),
                      Expanded(child: _buildOfferCard('Upto Rs.120 Off\non Grocery Delivery', 'Swiggy Instamart', '', Colors.orange)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _buildOfferCard('Rs.149 Rs.399\n1 Month Pack', 'OTTPlay', '62% Off', const Color(0xFF1A1A2E))),
                      const SizedBox(width: 12),
                      Expanded(child: _buildOfferCard('Flat Rs.449\nSilicone Products', 'Bare Anatomy', '', Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _buildOfferCard('Flat Rs.500 Off\non Wireless Earbuds', 'boAt', '', Colors.red)),
                      const SizedBox(width: 12),
                      Expanded(child: _buildOfferCard('Rs.1 Rs.1000\nOn Gold Plated Jewelry', 'KIMTI', '99% Off', Colors.green)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          TextButton(
            onPressed: onTap,
            child: const Text('View All'),
          ),
        ],
      ),
    );
  }

  Widget _buildScratchCard(String title, Color color) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: color,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildBrandDeal(String text, Color color) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text.replaceAll('\n', '\n'),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayWinCard(String title, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 32),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 70,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 11),
          ),
        ),
      ],
    );
  }

  Widget _buildGiftCard(String discount, Color color) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          discount,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(String title, String subtitle, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF002D72)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }

  Widget _buildSpinCard(String text, Color color) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, color],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            text.replaceAll('\n', '\n'),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Colors.grey),
      ),
    );
  }

  Widget _buildDropdown(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Icon(Icons.arrow_drop_down, size: 20),
        ],
      ),
    );
  }
  

  Widget _buildOfferCard(String title, String brand, String discount, Color color) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: color == Colors.white ? Colors.white : color,
        borderRadius: BorderRadius.circular(12),
        border: color == Colors.white ? Border.all(color: Colors.grey.shade300) : null,
      ),
      child: Stack(
        children: [
          if (discount.isNotEmpty)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  discount,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title.replaceAll('\n', '\n'),
                  style: TextStyle(
                    color: color == Colors.white ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  brand,
                  style: TextStyle(
                    color: color == Colors.white ? Colors.grey : Colors.white70,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}