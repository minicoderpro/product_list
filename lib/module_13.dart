import 'package:flutter/material.dart';
import 'package:practice/widget/product_card.dart';
import 'package:practice/widget/product_form_dialog.dart';
import 'ProductController.dart';

class Module13 extends StatefulWidget {
  const Module13({Key? key}) : super(key: key);

  @override
  State<Module13> createState() => _Module13State();
}

class _Module13State extends State<Module13> {
  final ProductController productController = ProductController();

  void productDialog({
    String? id,
    String? name,
    int? qty,
    String? img,
    int? unitPrice,
    int? totalPrice,
  }) {
    showDialog(
      context: context,
      builder: (context) => ProductFormDialog(
        id: id,
        name: name,
        img: img,
        qty: qty,
        unitPrice: unitPrice,
        totalPrice: totalPrice,
        onSubmit: (String name, String img, int qty, int price, int totalPrice) {
          if (id == null) {
            productController.createProduct(name, img, qty, price, totalPrice);
          } else {
            productController.UpdateProduct(id, name, img, qty, price, totalPrice);
          }
          fetchData();
          Navigator.pop(context);
        },
      ),
    );
  }

  Future<void> fetchData() async {
    await productController.fetchProducts();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(title: Text('Products')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 0.745,
        ),
        itemCount: productController.products.length,
        itemBuilder: (context, index) {
          var product = productController.products[index];
          return ProductCard(
            product: product,
            onEdit: () => productDialog(
              id: product.sId,
              name: product.productName,
              img: product.img,
              qty: product.qty,
              unitPrice: product.unitPrice,
              totalPrice: product.totalPrice,
            ),
            onDelete: () {
              productController.deleteProducts(product.sId!).then((value) {
                if (value) {
                  setState(() {
                    fetchData();
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Product deleted"), duration: Duration(seconds: 2)),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Something went wrong. Try again."), duration: Duration(seconds: 2)),
                  );
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => productDialog(),
        child: Icon(Icons.add),
      ),
    );
  }
}
