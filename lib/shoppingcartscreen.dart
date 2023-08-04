import 'package:flutter/material.dart';
import 'package:hello/checkoutscreen.dart';
import 'package:hello/product.dart';

class ShoppingCartScreen extends StatefulWidget {
  final List<Product> cartItems;

  ShoppingCartScreen({required this.cartItems});

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  double _totalAmount = 0;

  @override
  void initState() {
    super.initState();
    _calculateTotalAmount();
  }

  void _calculateTotalAmount() {
    double totalAmount = widget.cartItems
        .fold(0, (sum, item) => sum + (item.price * item.quantity));
    setState(() {
      _totalAmount = totalAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          return _buildCartItem(widget.cartItems[index], index);
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Total: \$${_totalAmount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutScreen(
                      totalAmount: _totalAmount,
                    ),
                  ),
                );
              },
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(Product product, int index) {
    return Card(
      key: ValueKey<int>(index), // Using index as the key
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.asset(
          product.imageUrls[0], // Display the first image in the cart
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        title: Text(product.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('\$${product.price.toStringAsFixed(2)}'),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (product.quantity > 0) {
                      setState(() {
                        product.quantity--;
                        _calculateTotalAmount(); // Recalculate total amount
                      });
                    }
                  },
                ),
                Text('${product.quantity}'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      product.quantity++;
                      _calculateTotalAmount(); // Recalculate total amount
                    });
                  },
                ),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.remove_shopping_cart),
          onPressed: () {
            setState(() {
              widget.cartItems.remove(product);
              _calculateTotalAmount(); // Recalculate total amount
            });
          },
        ),
      ),
    );
  }
}
