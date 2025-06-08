import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _countryController = TextEditingController();
  final _zipController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expirationController = TextEditingController();
  final _cvvController = TextEditingController();

  String? _selectedPackage;
  final List<String> _packages = [
    'Diet Plan 700 LKR',
    'Fitness Training 700 LKR',
    'Nutritional Guidelines 700 LKR',
    'Diet Plan + Fitness Training 1000 LKR',
    'Nutritional Guidelines+ Fitness Training 1200 LKR',
    'All in One Package 1600 LKR',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('asset/logo.png', height: 32, width: 32),
            const SizedBox(width: 8),
            const Text(
              "NutriNet",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 9, 60, 77),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "BILLING ADDRESS",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _fullNameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Enter your full name'
                            : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Enter your email';
                  if (!value.contains('@') || !value.contains('.')) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Enter your address'
                            : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _countryController,
                decoration: const InputDecoration(
                  labelText: 'Country',
                  border: OutlineInputBorder(),
                ),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Enter your country'
                            : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _zipController,
                decoration: const InputDecoration(
                  labelText: 'Zip Code',
                  border: OutlineInputBorder(),
                ),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Enter zip code'
                            : null,
              ),
              const SizedBox(height: 30),

              const Text(
                "PAYMENT",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text("Card Accepted"),
              const SizedBox(height: 5),
              Image.asset('asset/card_img.png', height: 32),
              const SizedBox(height: 15),
              TextFormField(
                controller: _cardNumberController,
                decoration: const InputDecoration(
                  labelText: 'Card Number',
                  hintText: '0000-0000-0000-0000',
                  border: OutlineInputBorder(),
                ),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Enter card number'
                            : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _expirationController,
                decoration: const InputDecoration(
                  labelText: 'Expiration Date',
                  hintText: 'MM/YY',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter expiration date';
                  }
                  final parts = value.split('/');
                  if (parts.length != 2) return 'Use MM/YY format';
                  final month = int.tryParse(parts[0]);
                  final year = int.tryParse(parts[1]);
                  if (month == null ||
                      year == null ||
                      month < 1 ||
                      month > 12) {
                    return 'Invalid date';
                  }
                  final now = DateTime.now();
                  final expYear = 2000 + year;
                  if (expYear < now.year || expYear > now.year + 5) {
                    return 'Year must be within next 5 years';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _cvvController,
                decoration: const InputDecoration(
                  labelText: 'CVV',
                  hintText: '123',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Enter CVV';
                  if (value.length != 3 || int.tryParse(value) == null) {
                    return 'CVV must be 3 digits';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              const Text(
                "SELECT PACKAGE",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                isExpanded: true, // Prevents overflow
                value: _selectedPackage,
                items:
                    _packages
                        .map(
                          (pkg) => DropdownMenuItem(
                            value: pkg,
                            child: Text(
                              pkg,
                              overflow:
                                  TextOverflow
                                      .ellipsis, // Optional: to handle very long text
                            ),
                          ),
                        )
                        .toList(),
                onChanged: (value) => setState(() => _selectedPackage = value),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Select a Package",
                ),
                validator: (value) => value == null ? 'Select a package' : null,
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Payment submitted successfully!'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 21, 128, 147),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    "Proceed To Checkup",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
