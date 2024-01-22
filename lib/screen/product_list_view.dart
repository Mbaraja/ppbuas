import 'package:flutter/material.dart';
import 'product_description_screen.dart';
import 'product.dart';
import 'payment_screen.dart';

class ProductListView extends StatefulWidget {
  @override
  _ProductListViewState createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  List<Product> products = [
    Product(
        'Es Teh Muanis',
        'Es teh seger untuk cuaca semarang yang panas',
        3000,
        'images/esteh.jpeg'),
    Product(
        'Lumpia',
        'Lumpia isi ayam.',
        2000,
        'images/lumpia.jpeg'),
    Product(
        'Tempe Mendoan',
        'Tempe yang dibaluri tepung mendoan',
        1000,
        'images/mendoan.jpeg'),
    Product(
        'Tahu Bulat',
        'Tahu Bulat digoreng dadakan ',
        1000,
        'images/tahubulat.jpeg'),
    Product(
        'Risol Mayo',
        'Risol yang berisi mayonaise, telur dan sosis',
        4000,
        'images/risolmayo.jpeg'),
    // Tambahkan produk lain di sini
  ];

  double totalSale = 0;
  int cartItemCount = 0;

  // List untuk menyimpan produk yang dibeli
  List<Product> cartProducts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar makanan dan minuman'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PaymentScreen(
                    cartProducts: cartProducts,
                    totalSale: totalSale,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Column(
            children: [
              Container(
                width:
                    double.infinity, // Agar gambar mengisi seluruh lebar layar
                child: Image.asset(
                  product.imagePath,
                  fit: BoxFit.cover,
                  height: 200, // Tinggi gambar
                ),
              ),
              ListTile(
                title: Align(
                  // Menempatkan nama produk di tengah
                  alignment: Alignment.center,
                  child: Text(
                    product.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle: Align(
                  // Menempatkan harga di tengah
                  alignment: Alignment.center,
                  child: Text(
                    'Rp ${product.price.toStringAsFixed(0)}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDescriptionScreen(product: product),
                    ),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  _startSale(product);
                },
                child: Text(
                  'Beli',
                  style: TextStyle(fontSize: 18), // Mengatur ukuran teks tombol
                ),
              ),
              SizedBox(height: 16), // Jarak antara item produk
            ],
          );
        },
      ),
    );
  }

  void _startSale(Product product) {
    int quantity = 1;
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Beli ${product.name}'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Harga: Rp ${product.price.toStringAsFixed(0)}'),
                  SizedBox(height: 10),
                  Text('Jumlah:'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                      ),
                      Text(quantity.toString()),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Batal'),
                ),
                TextButton(
                  onPressed: () {
                    double subTotal = product.price * quantity;
                    setState(() {
                      totalSale += subTotal;
                      // Menambahkan produk yang dibeli ke dalam keranjang
                      for (int i = 0; i < quantity; i++) {
                        cartProducts.add(product);
                      }
                      // Update jumlah item di keranjang
                      cartItemCount += quantity;
                    });

                    Navigator.of(context).pop();
                  },
                  child: Text('Beli'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showContactDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}
