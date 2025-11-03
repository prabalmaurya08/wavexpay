import 'package:flutter/material.dart';
import 'package:wavexpay/data/category_dummy_data.dart';
import 'package:wavexpay/screens/offersandCashbackScreen.dart';



import 'package:wavexpay/widgets/app_bar.dart';
import 'package:wavexpay/widgets/bottom_nav.dart';
import 'package:wavexpay/widgets/category_section.dart';
import 'package:wavexpay/widgets/scanner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;

  void _onBottomNavTap(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: kToolbarHeight + 30,
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 16,
                  right: 16,
                  bottom: 10,
                ),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  
                ),
                child: const AppBarSection(),
              ),

              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (scrollInfo) {
                    return false;
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                          
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 50,
                            ),
                            child: const Scanner(),
                          ),
                        ),

                        _mainContainer(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // ---- FLOATING BOTTOM NAV ----
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomNavBar(
              selectedIndex: _selectedIndex,
              onTap: _onBottomNavTap,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _mainContainer(BuildContext context) {
  return Container(
    transform: Matrix4.translationValues(0, -20, 0),
    width: double.infinity,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(28),
        topRight: Radius.circular(28),
      ),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -3)),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategorySection(
            title: "Money Transfer",
            categories: moneyTransferCategories,
            bgColor: Colors.blue,
            iconColor: Colors.white,
          ),
          const SizedBox(height: 14),
          CategorySection(
            title: "Popular",
            categories: popularCategories,
            bgColor: Colors.white,
            iconColor: Colors.blue,
          ),
          const SizedBox(height: 14),
          buildOfferBanner(context),
          const SizedBox(height: 14),
          CategorySection(
            title: "Utilities",
            categories: utilitiesCategories,
            bgColor: Colors.white,
            iconColor: Colors.blue,
          ),
          const SizedBox(height: 14),
          CategorySection(
            title: "Donations & Devotion",
            categories: donationsDevotionCategories,
            bgColor: Colors.white,
            iconColor: Colors.blue,
          ),
          const SizedBox(height: 14),
          CategorySection(
            title: "Financial Services & Taxes",
            categories: financialServicesCategories,
            bgColor: Colors.white,
            iconColor: Colors.blue,
          ),
          const SizedBox(height: 14),
          CategorySection(
            title: "More Services",
            categories: moreServicesCategories,
            bgColor: Colors.white,
            iconColor: Colors.blue,
          ),
          const SizedBox(height: 80),
        ],
      ),
    ),
  );
}



Widget buildOfferBanner(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Offersandcashbackscreen(),
          ), // Replace with your offer screen class
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF81D4FA),
              Color(0xFF1976D2),
            ], // Bright blue gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              width: 50,
              height: 50,
              child: Icon(Icons.card_giftcard, color: Colors.blue, size: 32),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Get upto ₹150 Cashback!",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Tap to view live offers and rewards.",
                    style: TextStyle(fontSize: 13, color: Colors.white70),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.white, size: 30),
          ],
        ),
      ),
    ),
  );
}
