import 'package:flutter/material.dart';

class ProductFormDialog extends StatefulWidget {
  final String? id;
  final String? name;
  final String? img;
  final int? qty;
  final int? unitPrice;
  final int? totalPrice;
  final Function(String name, String img, int qty, int price, int totalPrice) onSubmit;

  const ProductFormDialog({
    Key? key,
    this.id,
    this.name,
    this.img,
    this.qty,
    this.unitPrice,
    this.totalPrice,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<ProductFormDialog> createState() => _ProductFormDialogState();
}

class _ProductFormDialogState extends State<ProductFormDialog> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productImageController = TextEditingController();
  TextEditingController productQtyController = TextEditingController();
  TextEditingController productUnitPriceController = TextEditingController();
  TextEditingController productTotalPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    productNameController.text = widget.name ?? '';
    productImageController.text = widget.img ?? '';
    productQtyController.text = widget.qty?.toString() ?? '0';
    productUnitPriceController.text = widget.unitPrice?.toString() ?? '0';
    productTotalPriceController.text = widget.totalPrice?.toString() ?? '0';
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.id == null ? 'Add Product' : 'Update Product'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTextField(productNameController, 'Product Name'),
          _buildTextField(productImageController, 'Product Image'),
          _buildTextField(productQtyController, 'Product Quantity', keyboardType: TextInputType.number),
          _buildTextField(productUnitPriceController, 'Unit Price', keyboardType: TextInputType.number),
          _buildTextField(productTotalPriceController, 'Total Price', keyboardType: TextInputType.number),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: () => Navigator.pop(context), child: Text('Close')),
              ElevatedButton(
                onPressed: () {
                  widget.onSubmit(
                    productNameController.text,
                    productImageController.text,
                    int.parse(productQtyController.text),
                    int.parse(productUnitPriceController.text),
                    int.parse(productTotalPriceController.text),
                  );
                },
                child: Text(widget.id == null ? 'Add Product' : 'Update Product'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      keyboardType: keyboardType,
    );
  }
}
