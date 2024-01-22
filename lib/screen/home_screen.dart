import 'package:flutter/material.dart';
import 'package:bar_app/screen/konsumen_page.dart';
import 'package:bar_app/screen/product_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'product_list_view.dart';
import 'product_management.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.white, // Set AppBar background color to white
        actions: [
          TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            ),
            child: Text(
              'Keluar',
              style: TextStyle(
                color: Colors.black, // Set text color to black
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Set container color to white
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Column(
                children: [
                  Text(
                    'Selamat Datang',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Set text color to black
                    ),
                  ),
                  Text(
                    'Warung makan gile',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Set text color to black
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'images/telepon_icon.png',
                                width: 40.0,
                                height: 40.0,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '089652098065',
                                style: TextStyle(color: Colors.black), // Set text color to black
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Image.asset(
                    'images/company_logo.jpg',
                    width: 400.0,
                    height: 200.0,
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              Padding(
  padding: const EdgeInsets.all(8.0),
  child: ListView(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    children: [
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductPage(),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align to the start (left)
          children: [
            Image.asset(
              'images/product_icon.jpg',
              width: 80.0,
              height: 80.0,
            ),
            Text(
              'Kelola Produk',
              style: TextStyle(
                color: Colors.black, // Set text color to black
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 20.0), // Add space between the columns
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductListView(),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align to the start (left)
          children: [
            Image.asset(
              'images/shopping_icon.png',
              width: 80.0,
              height: 80.0,
            ),
            Text(
              'Shopping',
              style: TextStyle(
                color: Colors.black, // Set text color to black
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 20.0), // Add space between the columns
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CustomerPage(),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align to the start (left)
          children: [
            Image.asset(
              'images/customer_icon.png',
              width: 80.0,
              height: 80.0,
            ),
            Text(
              'Kelola Konsumen',
              style: TextStyle(
                color: Colors.black, // Set text color to black
              ),
            ),
          ],
        ),
      ),
    ],
  ),
),

              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductTablePage extends StatelessWidget {
  const ProductTablePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelola Produk (Tabel Produk)'),
        backgroundColor: Colors.white, // Set AppBar background color to white
      ),
      body: Center(
        child:
            Text('Ini adalah halaman untuk mengelola produk (tabel produk).'),
      ),
    );
  }
}

class CustomerTablePage extends StatelessWidget {
  const CustomerTablePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelola Konsumen (Tabel Konsumen)'),
        backgroundColor: Colors.white, // Set AppBar background color to white
      ),
      body: Center(
        child: Text(
            'Ini adalah halaman untuk mengelola konsumen (tabel konsumen).'),
      ),
    );
  }
}
