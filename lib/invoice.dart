import 'product.dart';
class Invoice {
  int invoiceNo;
  String customerName;
  List<Product> products;
  Invoice({this.invoiceNo, this.customerName, this.products});
  factory Invoice.fromJson(dynamic jsonObject) {
    var jsonArray = jsonObject['products'] as List;
    List<Product> _products = jsonArray.map((e) => Product.fromJson(e)).toList();
    return Invoice(
      invoiceNo: jsonObject['invoiceNo'] as int,
      customerName: jsonObject['customerName'],
      products: _products
    );
  }

  @override
  String toString() {
    return 'Invoice{invoiceNo: $invoiceNo, customerName: $customerName, products: $products}';
  }
}