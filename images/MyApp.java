import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShoppingScreen(),
    );
  }
}

class Product {
  final String name;
  final String image;
  final double price;
  final double rating;
  final String description;

  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
    required this.description,
  });
}

class ShoppingScreen extends StatefulWidget {
  @override
  _ShoppingScreenState createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  final List<Product> allProducts = [
    Product(
      name: 'Product 1',
      image: 'assets/product1.jpg', // Replace with your image path
      price: 19.99,
      rating: 4.5,
      description: 'Description for Product 1',
    ),
    Product(
      name: 'Product 2',
      image: 'assets/product2.jpg', // Replace with your image path
      price: 29.99,
      rating: 4.2,
      description: 'Description for Product 2',
    ),
    // Add more products as needed
  ];

  final List<Product> cart = [];
  final TextEditingController searchController = TextEditingController();
  bool searching = false;

  @override
  Widget build(BuildContext context) {
    final List<Product> displayedProducts = searching
        ? allProducts.where((product) {
            return product.name.toLowerCase().contains(searchController.text.toLowerCase());
          }).toList()
        : allProducts;

    int totalCartItems = cart.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Screen'),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CartScreen(cart: cart, allProducts: allProducts),
                    ),
                  );
                },
              ),
              totalCartItems > 0
                  ? CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 10,
                      child: Text(
                        totalCartItems.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search Products',
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      searching = false;
                      searchController.clear();
                    });
                  },
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searching = value.isNotEmpty;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: displayedProducts.length,
              itemBuilder: (context, index) {
                final product = displayedProducts[index];
                final int cartItemCount = cart.where((item) => item.name == product.name).length;

                return ListTile(
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductDescriptionScreen(product: product),
                        ),
                      );
                    },
                    child: Image.asset(
                      product.image,
                      width: 80.0,
                      height: 80.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(product.name),
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.star, color: Colors.yellow),
                      Text(product.rating.toString()),
                      SizedBox(width: 16.0),
                      Text('Qty: $cartItemCount'),
                      IconButton(
                        icon: Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          setState(() {
                            cart.add(product);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  final List<Product> cart;
  final List<Product> allProducts;

  CartScreen({required this.cart, required this.allProducts});

  double calculateTotalAmount() {
    double totalAmount = 0.0;
    for (var item in cart) {
      totalAmount += item.price;
    }
    return totalAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];
                return ListTile(
                  leading: Image.asset(
                    item.image,
                    width: 60.0,
                    height: 60.0,
                    fit: BoxFit.cover,
                  ),
                  title: Text(item.name),
                  subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Total Amount: \$${calculateTotalAmount().toStringAsFixed(2)}'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BuyNowScreen(cart: cart),
                ),
              );
            },
            child: Text('Buy Now'),
          ),
        ],
      ),
    );
  }
}

class ProductDescriptionScreen extends StatelessWidget {
  final Product product;

  ProductDescriptionScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(product.description),
      ),
    );
  }
}

class BuyNowScreen extends StatelessWidget {
  final List<Product> cart;

  BuyNowScreen({required this.cart});

  double calculateTotalAmount() {
    double totalAmount = 0.0;
    for (var item in cart) {
      totalAmount += item.price;
    }
    return totalAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Now'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Total Amount: \$${calculateTotalAmount().toStringAsFixed(2)}'),
          ),
          ElevatedButton(
            onPressed: () {
              // Implement logic to proceed with the purchase
            },
            child: Text('Confirm Purchase'),
          ),
        ],
      ),
    );
  }
}
