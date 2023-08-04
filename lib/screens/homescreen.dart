import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hello/productlistingscreen.dart';
import 'package:hello/profilescreen.dart'; // Import the ProfileScreen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Replace with your actual list of carousel items
  final List<String> carouselItems = [
    "assets/black.jpg",
    "assets/offer.jpg",
    "assets/sale.jpg",
    // ...
  ];

  // New lists of featured products/categories and their respective icons
  final List<String> featuredProductNames = [
    "Smartphones",
    "Fashion",
    "Laptops",
    "macbook"
  ];

  final List<IconData> featuredProductIcons = [
    Icons.smartphone,
    Icons.shop,
    Icons.laptop,
    Icons.laptop_chromebook
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
        actions: [
          IconButton(
            icon: Icon(Icons.person), // Profile icon
            onPressed: () {
              // Navigate to the ProfileScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Featured Products/Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: featuredProductNames.length,
                itemBuilder: (context, index) {
                  return YourProductWidget(
                    productName: featuredProductNames[index],
                    iconData: featuredProductIcons[index],
                    onPressed: () {
                      // Handle navigation to product listing screen here
                      // You can pass the selected category name to the listing screen if needed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductListingScreen(
                            category: featuredProductNames[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Latest Deals/Offers',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Container(
              width: double.infinity, // Adjust the width as needed
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 250, // Adjust the height as needed
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                ),
                items: carouselItems.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return YourCarouselItemWidget(item);
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16),
            // Add other widgets as needed (e.g., category grids, best-selling products, etc.)
            // ...
          ],
        ),
      ),
    );
  }
}

// Placeholder widget for featured products/categories with icons
class YourProductWidget extends StatelessWidget {
  final String productName;
  final IconData iconData;
  final VoidCallback onPressed;

  YourProductWidget({
    required this.productName,
    required this.iconData,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        color: Colors.grey[300],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, size: 40),
            SizedBox(height: 8),
            Text(productName),
          ],
        ),
      ),
    );
  }
}

// Placeholder widget for carousel items
class YourCarouselItemWidget extends StatelessWidget {
  final String imagePath;

  YourCarouselItemWidget(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      color: Colors.transparent,
      child: Center(
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
