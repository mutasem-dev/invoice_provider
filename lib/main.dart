import 'package:flutter/material.dart';
import 'package:invoice_provider_1/all_invoices_page.dart';
import 'package:invoice_provider_1/details_page.dart';
import 'package:invoice_provider_1/invoice_model.dart';
import 'package:provider/provider.dart';

import 'loading.dart';
import 'main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InvoiceModel(),
      child: MaterialApp(
        initialRoute: '/loading',
        routes: {
          '/' : (context)=>MainPage(),
          '/loading': (context)=>Loading(),
          '/allInvoices' : (context)=>AllInvoicesPage(),
          '/detailsPage' : (context)=>DetailsPage()
        },
      ),
    );
  }
}

