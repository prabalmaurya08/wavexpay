import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wavexpay/screens/offersandCashbackScreen.dart';
import 'package:wavexpay/screens/balance_history_screen.dart';
import 'package:wavexpay/screens/bank_transfer_screen.dart';
import 'package:wavexpay/screens/recharge_home.dart';
import 'package:wavexpay/screens/send_money_screen.dart';

class CategorySection extends StatelessWidget {
  final String title;
  final List<Map<String, String>> categories;
  final Color bgColor;
  final Color iconColor;

  const CategorySection({
    super.key,
    required this.categories,
    required this.title,
    required this.bgColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: Container(
        width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            /// 🧩 Responsive Grid
            LayoutBuilder(
              builder: (context, constraints) {
                // max width of the screen area
                double screenWidth = constraints.maxWidth;

                // define target width for each item
                double desiredItemWidth = 100;
                int crossAxisCount = (screenWidth / desiredItemWidth)
                    .floor()
                    .clamp(2, 5);

                return GridView.builder(
                  physics:
                      const NeverScrollableScrollPhysics(), // let parent scroll
                  shrinkWrap: true,
                  itemCount: categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 4,
                    childAspectRatio: 1, // adjust height vs width
                  ),
                  itemBuilder: (context, index) {
                    final item = categories[index];
                    return InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        final label = item['label']!;
                        switch (label) {
                          case 'Mobile Recharge':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const MobileRechargeHomeScreen(),
                              ),
                            );
                            break;
                          case 'To Bank/UPI':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const BankTransferScreen(),
                              ),
                            );
                            break;
                          case 'Self Account':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const Offersandcashbackscreen(),
                              ),
                            );
                            break;
                          case 'Pay To Contact':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SendMoneyScreen(),
                              ),
                            );
                            break;
                          case 'Check Balance':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const BalanceHistoryScreen(),
                              ),
                            );
                            break;
                        }
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: bgColor,
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              item['icon']!,
                              width: 30,
                              height: 30,
                              fit: BoxFit.contain,
                              colorFilter: ColorFilter.mode(
                               iconColor,
                                BlendMode.srcIn,
                              )
                            
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            item['label']!,
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 12,
                              height: 1.2,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:wavexpay/screens/OffersandCashbackScreen.dart';
// import 'package:wavexpay/screens/balance_history_screen.dart';
// import 'package:wavexpay/screens/bank_transfer_screen.dart';
// import 'package:wavexpay/screens/recharge_home.dart';
// import 'package:wavexpay/screens/send_money_screen.dart';

// class CategorySection extends StatelessWidget {
//   final String title;
//   final List<Map<String, String>> categories;
//   const CategorySection({
//     super.key,
//     required this.categories,
//     required this.title,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         double screenWidth = constraints.maxWidth;
//         double desiredItemWidth = 80; // target width per item
//         int itemsPerRow = (screenWidth / desiredItemWidth).floor();
//         double actualItemWidth =
//             (screenWidth - (itemsPerRow - 1) * 16) / itemsPerRow;
//        return
          
//      Card(
//             elevation: 1,
//             child: Container(
//              width: double.infinity,

//           padding: EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(28),
//             color: Colors.white,
//           ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(title),
//                   SizedBox(height: 10),
//                   Wrap(
//                     spacing: 16,
//                     runSpacing: 20,
//                     children: categories
//                         .map(
//                           (items) => InkWell(
//                             onTap: () {
//                               final String label = items['label']!;
//                               print("Tapped on: $label");

//                               // Use a switch statement to decide where to navigate
//                               switch (label) {
//                                 case 'Mobile Recharge':
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                           const MobileRechargeHomeScreen(),
//                                     ),
//                                   );
//                                   break;
//                                 case 'To Bank/UPI':
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                           const BankTransferScreen(),
//                                     ),
//                                   );
//                                   break;

//                                 case 'Self Account':
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                           const OffersandCashbackScreen(),
//                                     ),
//                                   );
//                                   break;

//                                 case 'Pay To Contact':
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                           const SendMoneyScreen(),
//                                     ),
//                                   );
//                                   break;

//                                 case 'Check Balance':
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                           const BalanceHistoryScreen(),
//                                     ),
//                                   );
//                                   break;
//                               }
//                             },
//                             borderRadius: BorderRadius.circular(12),
//                             child: SizedBox(
//                               width: actualItemWidth,
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Container(
//                                     padding: EdgeInsets.all(12),
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                     ),
//                                     child: SvgPicture.asset(
//                                       items['icon']!,
//                                       width: 30,
//                                       height: 30,
//                                       fit: BoxFit.contain,
//                                     ),
//                                   ),
//                                   SizedBox(height: 5),
//                                   Text(
//                                     items['label']!,
//                                     softWrap: true,
//                                     overflow: TextOverflow.ellipsis,
//                                     maxLines: 2,
//                                     textAlign: TextAlign.center,
//                                     style: const TextStyle(
//                                       fontSize: 12,
//                                       height: 1.2,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         )
//                         .toList(),
//                   ),
//                 ],
//               ),
//             ),
        
//         );
//       },
//     );
//   }
// }
