class Product {
  String pname;
  int quantity;
  double price;

  Product({this.pname, this.quantity, this.price});
  factory Product.fromJson(dynamic jsonObject) {
    return Product(
        pname: jsonObject['productName'],
        quantity: jsonObject['quantity'],
        price: jsonObject['price']
    );
  }

  @override
  String toString() {
    return 'Product{productName: $pname, quantity: $quantity, price: $price}';
  }
}