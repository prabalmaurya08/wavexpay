import 'package:flutter/material.dart';
import 'package:wavexpay/data/send_money_data.dart';
import 'package:wavexpay/screens/send_amount_screen.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredContacts = contacts
        .where((contact) =>
            contact.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            contact.number.contains(_searchQuery))
        .toList();

    final filteredSuggestions = suggestions
        .where((suggestion) =>
            suggestion.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    // Set a fixed number of rows for the horizontal grid
    const int suggestionsCrossAxisCount = 2;

    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
           
            Navigator.of(context).pop();
          },
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Send Money',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2),
            // Wrap this Row in a Flexible to prevent overflow on small screens
            Flexible(
              child: Row(
                children: [
                  const Text(
                    'Pay to any UPI app  ',
                    style: TextStyle(color: Colors.black87, fontSize: 12),
                  ),
                  const Text('Paytm',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(width: 4),
                  const Icon(Icons.account_balance_wallet,
                      size: 14, color: Colors.purple),
                  const SizedBox(width: 4),
                  const Icon(Icons.circle, size: 14, color: Colors.orange),
                  const SizedBox(width: 4),
                  const Text('BHIM',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
        toolbarHeight: 80,
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) => setState(() => _searchQuery = value),
                decoration: InputDecoration(
                  hintText: 'Enter new mobile number',
                  hintStyle:
                      TextStyle(color: Colors.grey.shade400, fontSize: 15),
                  prefixIcon: Icon(Icons.search,
                      color: Colors.cyan.shade600, size: 26),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Cashback Banner
                  _buildCashbackBanner(),

                  // Earn More Banner
                  _buildEarnMoreBanner(),

                  const SizedBox(height: 24),

                  // Suggestions Section
                  if (_searchQuery.isEmpty) ...[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Suggestions',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 180, // Fixed height for the horizontal grid
                      child: GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: suggestionsCrossAxisCount, // 2 rows
                          mainAxisSpacing: 12, // Vertical spacing between rows
                          crossAxisSpacing: 12, // Horizontal spacing between items
                          childAspectRatio: 0.9, // height / width
                        ),
                        itemCount: filteredSuggestions.length,
                        itemBuilder: (context, index) => _buildSuggestionItem(
                            context, filteredSuggestions[index]),
                      ),
                    ),
                  ],

                  const SizedBox(height: 24),

                  // Contacts Section
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Contacts',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    color: Colors.white,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredContacts.length,
                      separatorBuilder: (context, index) => Divider(
                        height: 1,
                        indent: 72,
                        color: Colors.grey.shade200,
                      ),
                      itemBuilder: (context, index) =>
                          _buildContactItem(filteredContacts[index]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- WIDGET BUILDER METHODS ---

  Widget _buildSuggestionItem(BuildContext context, Suggestion suggestion) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Given a container height of ~94px (200px height / 2 rows - spacing)
        // Let's define sizes that *will* fit.

        // Make avatar ~50% of the available height
        final double avatarSize = constraints.maxHeight * 0.5; // ~47px
        // Use a fixed, readable font size
        const double fontSize = 12;
        // Make the verified icon a reasonable, fixed size
        const double iconSize = 16;
        const double iconPadding = 2;

        return Column(
          // Center the content vertically within the 94px box
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: avatarSize,
                  height: avatarSize,
                  decoration: BoxDecoration(
                    color: suggestion.color,
                    shape: BoxShape.circle,
                  ),
                  child: suggestion.imageUrl != null
                      ? Icon(Icons.person,
                          color: Colors.white, size: avatarSize * 0.7)
                      : Center(
                          child: Text(
                            suggestion.initial ?? '',
                            style: TextStyle(
                              color: suggestion.color == Colors.black
                                  ? Colors.white
                                  : Colors.black87,
                              fontSize: avatarSize * 0.5, // ~23px
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                ),
                if (suggestion.isVerified)
                  Positioned(
                    right: -iconSize * 0.25,  // -4
                    bottom: -iconSize * 0.25, // -4
                    child: Container(
                      padding: const EdgeInsets.all(iconPadding), // 2
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: iconSize, // 16
                      ),
                    ),
                  ),
              ],
            ),
            
            const SizedBox(height: 8),

            SizedBox(
              width: constraints.maxWidth,
              child: Text(
                suggestion.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: fontSize, // 12px
                  height: 1.2, // Line height
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildContactItem(Contact contact) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SendMoneyAmountScreen(
              name: contact.name,
              number: contact.number,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: contact.color,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  contact.initial,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact.name,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    contact.number,
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCashbackBanner() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color(0xFFB2EBF2), const Color(0xFF80DEEA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.card_giftcard, color: Colors.blue, size: 28),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get Assured Cashback up to Rs....',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                Text(
                  '15d : 12h : 09m : 13s',
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.black),
        ],
      ),
    );
  }

  Widget _buildEarnMoreBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color(0xFF8D6E63), const Color(0xFF5D4037)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Send higher amount to earn more!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.amber.shade700,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: [
                Icon(Icons.stars, color: Colors.white, size: 20),
                SizedBox(width: 4),
                Text(
                  '⭐',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}