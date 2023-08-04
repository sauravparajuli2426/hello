import 'package:flutter/material.dart';
import 'package:hello/loginscreen.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  @override
  _PasswordRecoveryScreenState createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Recovery'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an email';
                  }
                  if (!isValidEmail(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _recoverPassword();
                  }
                },
                child: Text('Recover Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _recoverPassword() {
    // Implement password recovery logic here
    // You can use _emailController.text
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Password recovery email sent!'),
      ),
    );

    // Navigate back to LoginScreen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}

bool isValidEmail(String email) {
  // Implement email validation logic here
  return true;
}
