import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  final String id;
  final String name;
  final String city;
  final String img_url;
  final double rating;
  final int price;
  final String desc;

  DestinationModel({
    required this.id,
    this.name = '',
    this.city = '',
    this.img_url = '',
    this.rating = 0.0,
    this.price = 0,
    this.desc = '',
  });

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) =>
      DestinationModel(
        id: id,
        name: json['name'],
        city: json['city'],
        img_url: json['img_url'],
        rating: json['rating'].toDouble(),
        price: json['price'],
        desc: json['desc'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'city': city,
        'img_url': img_url,
        'rating': rating,
        'price': price,
      };

  @override
  List<Object> get props => [id, name, city, img_url, price, rating, desc];
}
