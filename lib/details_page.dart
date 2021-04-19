import 'package:flutter/material.dart';
import 'package:invoice_provider_1/invoice_model.dart';
import 'invoice.dart';
import 'package:provider/provider.dart';
import 'product.dart';
class DetailsPage extends StatelessWidget {

  double totalPrice = 0;
  int totalQuantity = 0;
  void calc(BuildContext context) {

    context.read<InvoiceModel>().invoice.products.forEach((element) {
      totalPrice += element.quantity*element.price;
      totalQuantity += element.quantity;
    });
  }
  @override
  Widget build(BuildContext context) {
    calc(context);
    return Consumer<InvoiceModel>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(value.invoice.customerName),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Invoice#: ${value.invoice.invoiceNo}",
                style: TextStyle(
                    fontSize: 25
                ),
              ),
              SizedBox(height: 10,),
              Text("Products",
                style: TextStyle(
                    fontSize: 25
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  itemCount: value.invoice.products.length,
                  itemBuilder: (context, index) {

                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(''
                          '${index+1} - ${value.invoice.products[index].pname}'
                          ', Price: ${value.invoice.products[index].price},'
                          'quantity: ${value.invoice.products[index].quantity}'
                          ,
                          style: TextStyle(
                              fontSize: 16
                          )
                      ),
                    );
                  },
                ),

              ),
              Text('Total Price: $totalPrice\nTotal Quantity: $totalQuantity',
                  style: TextStyle(
                      fontSize: 18
                  )),
            ],
          ),
        );
      },
    );
  }
}
