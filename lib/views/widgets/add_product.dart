import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vazifa16/model/product.dart';
import 'package:vazifa16/providers/product_provider.dart';

class AddProductAlertDialog extends StatefulWidget {
  final bool isAdd;
  final Product? product;
  const AddProductAlertDialog({
    super.key,
    required this.isAdd,
    this.product,
  });

  @override
  State<AddProductAlertDialog> createState() => _AddProductAlertDialogState();
}

class _AddProductAlertDialogState extends State<AddProductAlertDialog> {
  final TextEditingController courseTitle = TextEditingController();
  final TextEditingController coursePrice = TextEditingController();

  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (!widget.isAdd && widget.product != null) {
      courseTitle.text = widget.product!.title;
      coursePrice.text = widget.product!.price.toString();
    }
  }

  void onSaveTapped(ProductsController productController) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (widget.isAdd == false) {
        productController.editProduct(
          widget.product!.id,
          courseTitle.text,
          int.parse(coursePrice.text),
        );
      } else {
        productController.addProduct(Product(
          id: UniqueKey().toString(),
          color: Colors.grey,
          title: courseTitle.text,
          price: int.parse(coursePrice.text),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ProductsController productsController =
        Provider.of<ProductsController>(context);
    return SingleChildScrollView(
      child: AlertDialog(
        backgroundColor: const Color.fromARGB(173, 20, 31, 83),
        title: widget.isAdd
            ? const Text("Add Products")
            : const Text("Edit Products"),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: courseTitle,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  label: widget.isAdd
                      ? const Text("Title")
                      : const Text("New Title"),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Input Title";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: coursePrice,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  label: widget.isAdd
                      ? const Text("Price")
                      : const Text("New Price"),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Input Price";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text(
              "Bekor qilish",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              onSaveTapped(productsController);
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: widget.isAdd
                ? const Text("Qo'shish")
                : const Text("O'zgartrish"),
          )
        ],
      ),
    );
  }
}