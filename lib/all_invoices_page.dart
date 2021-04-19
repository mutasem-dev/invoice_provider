import 'package:flutter/material.dart';
import 'package:invoice_provider_1/invoice_model.dart';
import 'details_page.dart';
import 'package:provider/provider.dart';

import 'invoice.dart';
class AllInvoicesPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Customers'),
      ),
      body: Consumer<InvoiceModel>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.invoices.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  value.setSelectedIndex(index);
                  Navigator.pushNamed(context,'/detailsPage');
                },
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  color: Colors.blue,
                  child: Text(value.invoices[index].customerName,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              );
            },
          );
        },

      ),
    );
  }
}
