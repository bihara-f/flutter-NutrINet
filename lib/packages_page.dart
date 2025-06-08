import 'package:flutter/material.dart';

class PackagesPage extends StatelessWidget {
  const PackagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final packages = [
      {
        "title": "Diet Plan",
        "price": "700 LKR",
        "image": "asset/diet-planner.jpg",
      },
      {
        "title": "Fitness Training",
        "price": "700 LKR",
        "image": "asset/fittrain.jpeg",
      },
      {
        "title": "Nutritional Guidelines",
        "price": "700 LKR",
        "image": "asset/nutri.jpeg",
      },
      {
        "title": "Diet Plan + Fitness Training",
        "price": "1000 LKR",
        "image": "asset/dietfit.webp",
      },
      {
        "title": "Nutritional Guidelines + Fitness Training",
        "price": "1200 LKR",
        "image": "asset/nutri+fitness.png",
      },
      {
        "title": "All In One Package",
        "price": "1600 LKR",
        "image": "asset/allinone.jpeg",
      },
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Center(
              child: Text(
                "Our Packages",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: GridView.builder(
                itemCount: packages.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  // Show 3 columns in landscape and 2 columns in portrait
                  crossAxisCount:
                      MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? 3
                          : 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final package = packages[index];
                  return PackageCard(
                    title: package["title"]!,
                    price: package["price"]!,
                    imagePath: package["image"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PackageCard extends StatelessWidget {
  final String title;
  final String price;
  final String imagePath;

  const PackageCard({
    super.key,
    required this.title,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black87;

    return Card(
      elevation: 4,
      shadowColor: Colors.grey.withOpacity(0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: textColor,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(price, style: TextStyle(fontSize: 14, color: textColor)),
        ],
      ),
    );
  }
}
