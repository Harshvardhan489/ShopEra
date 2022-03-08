import 'package:flutter/material.dart';

class Product {
  final String image, title, description, review;
  final int price, size, id;
  final double rating;
  final Color color;
  bool done;
  var star = 0.5;
  bool incart;
  Product(
      {this.star,
      this.id,
      this.image,
      this.title,
      this.price,
      this.description,
      this.size,
      this.color,
      this.review,
      this.done,
      this.incart,
      this.rating});
}

List<Product> products = [
  Product(
      id: 1,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      review: dummyreview,
      image: "assets/images/bag_1.png",
      rating: 4.0,
      done: false,
      incart: false,
      color: Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "Belt Bag",
      price: 234,
      size: 8,
      description: dummyText,
      review: dummyreview,
      image: "assets/images/bag_2.png",
      rating: 4.5,
      done: false,
      incart: false,
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Hang Top",
      price: 234,
      size: 10,
      description: dummyText,
      review: dummyreview,
      image: "assets/images/bag_3.png",
      rating: 3.5,
      done: false,
      incart: false,
      color: Color(0xFF989493)),
  Product(
      id: 4,
      title: "Old Fashion",
      price: 234,
      size: 11,
      description: dummyText,
      review: dummyreview,
      image: "assets/images/bag_4.png",
      rating: 3.0,
      done: false,
      incart: false,
      color: Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      review: dummyreview,
      image: "assets/images/bag_5.png",
      rating: 4.5,
      done: false,
      color: Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    review: dummyreview,
    image: "assets/images/bag_6.png",
    rating: 4.0,
    done: false,
    color: Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";

String dummyreview =
    "Nice product. Really good to use.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley";
