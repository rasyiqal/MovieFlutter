class Ramen {
  final String description;
  final String imgUrl;
  final int price;
  final String productName;

  const Ramen(
      {required this.description,
      required this.imgUrl,
      required this.price,
      required this.productName});

  factory Ramen.fromJson(Map<String, dynamic> json) {
    return Ramen(
        description: json['description'],
        imgUrl: json['img_url'],
        price: json['price'],
        productName: json['product_name']);
  }
}
