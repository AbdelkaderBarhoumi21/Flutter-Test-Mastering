import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  void _login() {
    if (_emailController.text == "abdelkader@gmail.com" &&
        _passwordController.text == "password123") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProductListPage()),
      );
    } else {
      setState(() {
        _errorMessage = "Invalid credentials";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              key: const ValueKey('emailField'),
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              key: const ValueKey('passwordField'),
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              key: const ValueKey('loginButton'),
              onPressed: _login,
              child: const Text('Login'),
            ),
            if (_errorMessage != null) ...[
              const SizedBox(height: 8),
              Text(
                _errorMessage!,
                key: const ValueKey('errorText'),
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/* ----------------------- ProductListPage ------------------------- */

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final List<String> _products = ['Product 1', 'Product 2'];

  void _addProduct(String productName) {
    setState(() {
      _products.add(productName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product List')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  key: Key('product_$index'),
                  title: Text(_products[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailsPage(productName: _products[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            key: const Key('addProductButton'),
            onPressed: () async {
              final result = await showDialog<String>(
                context: context,
                builder: (context) => const AddProductDialog(),
              );
              if (result != null && result.trim().isNotEmpty) {
                _addProduct(result.trim());
              }
            },
            child: const Text('Add Product'),
          ),
        ],
      ),
    );
  }
}

/* ---------------------- ProductDetailsPage ----------------------- */

class ProductDetailsPage extends StatelessWidget {
  final String productName;
  const ProductDetailsPage({super.key, required this.productName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: Center(child: Text('Details for $productName')),
    );
  }
}

/* ------------------------ AddProductDialog ----------------------- */

class AddProductDialog extends StatefulWidget {
  const AddProductDialog({super.key});

  @override
  State<AddProductDialog> createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Product'),
      content: TextField(
        key: const Key('addProductField'),
        controller: _controller,
        decoration: const InputDecoration(hintText: 'Product name'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          key: const Key('confirmAddProduct'),
          onPressed: () => Navigator.pop(context, _controller.text),
          child: const Text('Add'),
        ),
      ],
    );
  }
}
