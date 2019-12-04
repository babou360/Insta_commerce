

class Product{
  String brand;
  String category;
  String id;
  String name;
  double price;
  int quantity;
  List images,sizes;

  Product.fromMap(Map<String,dynamic>data){
    brand=data['brand'];
    category=data['category'];
    id=data['id'];
    name=data['name'];
    price=data['price'];
    quantity=data['quantity'];
    images=data['images'];
    sizes=data['sizes'];
  }
}