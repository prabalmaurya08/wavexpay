import 'package:flutter/material.dart';

void main() {
  runApp(const PaytmBalanceHistoryApp());
}

class PaytmBalanceHistoryApp extends StatelessWidget {
  const PaytmBalanceHistoryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paytm Balance & History',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFD5E3F0),
      ),
      home: const BalanceHistoryScreen(),
    );
  }
}

// Models
class PaymentTransaction {
  final String name;
  final String date;
  final String amount;
  final String type; // sent, received, bill
  final String initial;
  final Color color;
  final String category;
  final String? iconUrl;

  PaymentTransaction({
    required this.name,
    required this.date,
    required this.amount,
    required this.type,
    required this.initial,
    required this.color,
    required this.category,
    this.iconUrl,
  });
}

class BalanceHistoryScreen extends StatefulWidget {
  const BalanceHistoryScreen({Key? key}) : super(key: key);

  @override
  State<BalanceHistoryScreen> createState() => _BalanceHistoryScreenState();
}

class _BalanceHistoryScreenState extends State<BalanceHistoryScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final Map<String, List<PaymentTransaction>> transactionsByMonth = {
    'October 2025': [
      PaymentTransaction(
        name: 'Anurag Gupta',
        date: 'Sent on 24 Oct, 01:17 PM',
        amount: '- ₹1,500',
        type: 'sent',
        initial: 'AG',
        color: const Color(0xFFB3E5FC),
        category: 'Transfers',
      ),
      PaymentTransaction(
        name: 'Vikram Active',
        date: 'Received on 19 Oct, 11:46 AM',
        amount: '+ ₹1,000',
        type: 'received',
        initial: 'VA',
        color: const Color(0xFFE1BEE7),
        category: 'Money Received',
      ),
    ],
    'August 2025': [
      PaymentTransaction(
        name: 'Excitel Broadband',
        date: 'Paid on 26 Aug, 11:09 AM',
        amount: '- ₹6,357.84',
        type: 'bill',
        initial: 'EB',
        color: const Color(0xFFFFE0B2),
        category: 'Bill Payments',
        iconUrl: 'broadband',
      ),
      PaymentTransaction(
        name: 'One97 Communications Limited',
        date: 'Received on 19 Aug, 02:02 PM',
        amount: '+ ₹1',
        type: 'received',
        initial: 'OL',
        color: const Color(0xFFE1BEE7),
        category: 'Money Received',
      ),
    ],
  };

  final Map<String, double> monthlySpent = {
    'October 2025': 1500,
    'August 2025': 6357.84,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD5E3F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD5E3F0),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Balance & History',
          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(Icons.circle, color: Colors.amber, size: 12),
                  ),
                ),
                const SizedBox(width: 6),
                const Text(
                  '0',
                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),

            // Your Accounts Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Your Accounts',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 12),

            // Account Cards Row
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildAccountCard(
                    title: 'SBI Bank',
                    subtitle: 'A/c No - 0393',
                    isPrimary: true,
                    buttonText: 'Check Balance',
                    color: Colors.blue.shade800,
                    hasInfoIcon: true,
                  ),
                  const SizedBox(width: 12),
                  _buildAccountCard(
                    title: 'UPI Lite',
                    subtitle: 'PIN-less & Super\nfast payments',
                    isPrimary: false,
                    buttonText: 'Activate',
                    color: Colors.blue.shade600,
                    hasWalletIcon: true,
                  ),
                  const SizedBox(width: 12),
                  _buildAddRupayCard(),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Recommended Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recommended',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildRecommendedCard(
                    icon: '👑',
                    title: 'Save in Gold',
                    subtitle: 'Upto ₹10000 OFF',
                  ),
                  const SizedBox(width: 12),
                  _buildRecommendedCard(
                    icon: '⚗️',
                    title: 'SIP & Mutual Funds',
                    subtitle: 'Paytm Money',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Payment History Section
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 20, 16, 16),
                    child: Text(
                      'Payment History',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),

                  // Search Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            onChanged: (value) => setState(() => _searchQuery = value),
                            decoration: InputDecoration(
                              hintText: 'Search your payments',
                              hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                              prefixIcon: Icon(Icons.search, color: Colors.cyan.shade600, size: 24),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade300),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade300),
                              ),
                              contentPadding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.cyan.shade600),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.tune, color: Colors.cyan.shade600, size: 20),
                              const SizedBox(width: 4),
                              Text(
                                'Filter',
                                style: TextStyle(color: Colors.cyan.shade600, fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Transactions List
                  ...transactionsByMonth.entries.map((entry) {
                    return _buildMonthSection(entry.key, entry.value, monthlySpent[entry.key] ?? 0);
                  }),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountCard({
    required String title,
    required String subtitle,
    required bool isPrimary,
    required String buttonText,
    required Color color,
    bool hasInfoIcon = false,
    bool hasWalletIcon = false,
  }) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, color.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (isPrimary)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade700,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'Primary',
                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              if (hasInfoIcon)
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.info_outline, color: Colors.white, size: 18),
                ),
              if (hasWalletIcon)
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.account_balance_wallet, color: Colors.white, size: 18),
                ),
            ],
          ),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
          if (isPrimary) ...[
            const SizedBox(height: 8),
            const Text(
              'Add Money +',
              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddRupayCard() {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300, style: BorderStyle.solid, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.add, color: Colors.blue.shade700, size: 24),
          ),
          const Spacer(),
          const Text(
            'Add Rupay Card on',
            style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Container(
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange.shade400, Colors.red.shade400],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'RuPay',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendedCard({
    required String icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(icon, style: const TextStyle(fontSize: 32)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthSection(String month, List<PaymentTransaction> transactions, double totalSpent) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                month,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Total Spent',
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                      ),
                      Text(
                        '₹${totalSpent.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),
            ],
          ),
        ),
        ...transactions.map((transaction) => _buildTransactionItem(transaction)),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildTransactionItem(PaymentTransaction transaction) {
    final isNegative = transaction.amount.startsWith('-');
    final isPositive = transaction.amount.startsWith('+');

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: transaction.color,
                  shape: BoxShape.circle,
                ),
                child: transaction.iconUrl != null
                    ? Icon(Icons.wifi, color: Colors.orange.shade700, size: 24)
                    : Center(
                        child: Text(
                          transaction.initial,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      transaction.date,
                      style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    transaction.amount,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isPositive ? Colors.green : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        isNegative ? 'From' : (isPositive ? 'To' : 'In'),
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.account_balance_wallet, color: Colors.white, size: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: transaction.type == 'received'
                  ? Colors.green.shade50
                  : transaction.type == 'bill'
                      ? Colors.blue.shade50
                      : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: transaction.type == 'received'
                    ? Colors.green.shade200
                    : transaction.type == 'bill'
                        ? Colors.blue.shade200
                        : Colors.grey.shade300,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  transaction.type == 'received'
                      ? Icons.currency_rupee
                      : transaction.type == 'bill'
                          ? Icons.receipt
                          : Icons.swap_horiz,
                  size: 14,
                  color: transaction.type == 'received'
                      ? Colors.green.shade700
                      : transaction.type == 'bill'
                          ? Colors.blue.shade700
                          : Colors.grey.shade700,
                ),
                const SizedBox(width: 4),
                Text(
                  transaction.category,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: transaction.type == 'received'
                        ? Colors.green.shade700
                        : transaction.type == 'bill'
                            ? Colors.blue.shade700
                            : Colors.grey.shade700,
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