import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  final double totalAmount;

  CheckoutScreen({required this.totalAmount});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool _isPlacingOrder = false; // Track whether an order is being placed
  bool _isOrderPlaced = false; // Track whether the order is placed successfully

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Order Summary',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text('Total Amount: \$${widget.totalAmount.toStringAsFixed(2)}'),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed:
                  _isPlacingOrder ? null : _placeOrderUsingCashOnDelivery,
              style: ElevatedButton.styleFrom(
                primary: _isOrderPlaced ? Colors.green : Colors.white,
              ),
              child: Text(_isOrderPlaced
                  ? 'Order Placed'
                  : 'Place Order (Cash on Delivery)'),
            ),
          ],
        ),
      ),
    );
  }

  void _placeOrderUsingCashOnDelivery() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Order'),
          content: Text(
              'Are you sure you want to place the order with Cash on Delivery?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _proceedWithCashOnDelivery();
              },
              child: Text('Confirm'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  _isOrderPlaced =
                      false; // Set order placed status to false on cancel
                });
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _proceedWithCashOnDelivery() {
    setState(() {
      _isPlacingOrder = true; // Start placing the order
    });

    // Simulate order placement process with a delay
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isPlacingOrder = false; // Stop placing the order
        _isOrderPlaced = true; // Mark the order as placed

        // Show a success snackbar message
        _showOrderPlacedSnackbar();

        // Navigate to the order history screen if needed
      });
    });
  }

  void _showOrderPlacedSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Order placed successfully using Cash on Delivery!'),
      ),
    );
  }
}
