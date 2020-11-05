import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, id, preparation;
  final Color color;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.color,
    this.preparation,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Venilla",
      price: 200,
      preparation:2,
      description: dummyText,
      image: "assets/images/cake1.jpg",
      color: Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "Chocolate bomb",
      price: 250,
      preparation:2,
      description: dummyText,
      image: "assets/images/cake5.png",
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Black Forest",
      price: 250,
      preparation:1,
      description: dummyText,
      image: "assets/images/cake2.jpg",
      color: Color(0xFF989493)),
  Product(
      id: 4,
      title: "Fruit Bomb",
      price: 500,
      preparation:1,
      description: dummyText,
      image: "assets/images/cake3.jpg",
      color: Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "Wedding cake",
      price: 1000,
      preparation:3,
      description: dummyText,
      image: "assets/images/cake4.jpg",
      color: Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "Plain Cake",
    price: 150,
    preparation:1,
    description: dummyText,
    image: "assets/images/cake5.png",
    color: Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Delicious cakes are available here......";
