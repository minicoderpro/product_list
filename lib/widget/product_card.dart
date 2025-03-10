import 'package:flutter/material.dart';
import '../model/product.dart';

class ProductCard extends StatelessWidget {
  final Data product;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ProductCard({
    super.key,
    required this.product,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5)],
      ),
      margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _productImage(),
          _productDetails(),
        ],
      ),
    );
  }

  Widget _productImage() {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      child: Container(
        height: 130,
        color: Colors.grey.shade200,
        child: Image.network(
          product.img.toString(),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _productDetails() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.productName.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            'Price: ${product.unitPrice} | Qty: ${product.qty}',
            style: TextStyle(fontSize: 16, color: Colors.black54),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: onEdit, icon: Icon(Icons.edit)),
                IconButton(onPressed: onDelete, icon: Icon(Icons.delete, color: Colors.red)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
