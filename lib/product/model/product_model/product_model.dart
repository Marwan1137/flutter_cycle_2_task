import 'rating.dart';

/* -------------------------------------------------------------------------- */
/*                    ProductModel class to represent product data            */
/* -------------------------------------------------------------------------- */
class ProductModel {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating? rating;

  /* -------------------------------------------------------------------------- */
  /*                      Constructor for initializing ProductModel             */
  /* -------------------------------------------------------------------------- */
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  /* -------------------------------------------------------------------------- */
  /*        Factory constructor to create ProductModel from JSON data           */
  /* -------------------------------------------------------------------------- */
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as int,
        title: json['title'] as String,
        price: (json['price'] as num).toDouble(),
        description: json['description'] as String,
        category: json['category'] as String,
        image: json['image'] as String,
        rating: json['rating'] == null
            ? null
            : Rating.fromJson(json['rating'] as Map<String, dynamic>),
      );

  /* -------------------------------------------------------------------------- */
  /*         Method to convert ProductModel to a JSON map representation        */
  /* -------------------------------------------------------------------------- */
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
        'rating': rating?.toJson(),
      };
}
