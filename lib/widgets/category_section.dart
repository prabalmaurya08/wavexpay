import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategorySection extends StatelessWidget {
  final String title;
  final List<Map<String, String>> categories;
  const CategorySection({
    super.key,
    required this.categories,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double desiredItemWidth = 80; // target width per item
        int itemsPerRow = (screenWidth / desiredItemWidth).floor();
        double actualItemWidth =
            (screenWidth - (itemsPerRow - 1) * 16) / itemsPerRow;
        return Container(
          alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),

          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
        
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              SizedBox(height: 10),
              Wrap(
                spacing: 16,
                runSpacing: 20,
                children: categories
                    .map(
                      (items) => SizedBox(
                        width: actualItemWidth,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(   shape: BoxShape.circle),
                              child: SvgPicture.asset(items['icon']!,width: 30,height: 30,fit: BoxFit.contain ),
                            ),
                            SizedBox(height: 5,),
                            Text(items['label']!,softWrap: true,overflow: TextOverflow.ellipsis,
                            maxLines: 2,textAlign: TextAlign.center,style: const TextStyle(
                                fontSize: 12,
                                height: 1.2,
                                fontWeight: FontWeight.w500,
                              ))
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
