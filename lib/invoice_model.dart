import 'package:flutter/cupertino.dart';

import 'invoice.dart';

class InvoiceModel extends ChangeNotifier {
  int _selectedIndex = 0;
  List<Invoice> _invoices = [];
  void setInvoices(List<Invoice> invoices) {
    _invoices = invoices;
    notifyListeners();
  }
  void addInvoice(Invoice invoice) {
    _invoices.add(invoice);
    notifyListeners();
  }
  void removeInvoice(int index) {
    _invoices.removeAt(index);
    notifyListeners();
  }
  int get length => _invoices.length;
  List<Invoice> get invoices => _invoices;
  int get selectedIndex => _selectedIndex;
  Invoice get invoice => _invoices[_selectedIndex];
  void setSelectedIndex(int index) {
    _selectedIndex = index;
  }
}