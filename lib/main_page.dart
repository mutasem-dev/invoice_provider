import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:invoice_provider_1/invoice_model.dart';
import 'all_invoices_page.dart';
import 'invoice.dart';
import 'product.dart';
import 'product_list_item.dart';
import 'package:toast/toast.dart';
import 'package:provider/provider.dart';
class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
      builder: (context) {
        TextEditingController nameController = TextEditingController();
        TextEditingController quantityController = TextEditingController();
        TextEditingController priceController = TextEditingController();
        return AlertDialog(

          title: Text('Product Info'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: 'Product Name'
                  ),
                ),
                TextField(
                  controller: quantityController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Quantity'
                  ),
                ),
                TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Price'
                  ),
                ),
              ],
            ),
          ),
          actions: [
            RaisedButton(
              child: Text('add'),
                onPressed: () {
                  products.add(Product(
                    pname: nameController.text,
                    quantity: int.parse(quantityController.text),
                    price: double.parse(priceController.text)
                  ));
                  Navigator.of(context).pop();
                  setState(() {

                  });

                }
            ),
            RaisedButton(
                child: Text('cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                }
            ),
          ],
        );
      },
    );
  }


  List<Product> products = [];
  TextEditingController cnameController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // List<Invoice> invs = context.read<InvoiceModel>().invoices;
    // if(invs.isNotEmpty)
    //   invoiceNo = invs[invs.length-1].invoiceNo+1;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<InvoiceModel>(
          builder: (context, value, child) {
            if(value.length!=0)
              return Text("Invoice#: ${context.watch<InvoiceModel>().invoices.last.invoiceNo+1}");
            return Text("Invoice#: 1");

          },
        )
      ),
      body: Column(
        children: [
          TextField(
            controller: cnameController,
            decoration: InputDecoration(
              labelText: 'Customer Name'
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Products: '),
              RaisedButton(
                child: Text('add product'),
                  onPressed: () {
                    _showDialog(context);
                  }
              ),
            ],
          ),
          Consumer<InvoiceModel>(
            builder: (context, value, child) {
              return Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductListItem(
                      product: products[index],
                      deleteProduct: () {
                        products.removeAt(index);
                        setState(() {

                        });
                      },
                    );
                  },
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Consumer<InvoiceModel>(
                builder: (context, value, child) {
                  return RaisedButton(
                      child: Text('add invoice'),
                      onPressed: () {
                        if(cnameController.text.isEmpty ) {
                          Toast.show("please enter customer name", context);
                          return;
                        }
                        if(products.isEmpty) {
                          Toast.show("please add at least one product", context);
                          return;
                        }
                        int invNo = 1;
                        if(value.length != 0)
                          invNo = value.invoices.last.invoiceNo+1;
                        value.addInvoice(Invoice(
                            invoiceNo: invNo,
                            customerName: cnameController.text,
                            products: products
                        ));
                          cnameController.clear();
                          products = [];
                      }
                  );
                },

              ),
              RaisedButton(
                  child: Text('show all invoices'),
                  onPressed: () {
                    Navigator.pushNamed(context,'/allInvoices');
                  }
              ),
            ],
          ),
        ],
      ),
    );
  }
}
