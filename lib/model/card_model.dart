// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CardModel {
  final String code;
  final String image;
  final String value;
  final String suit;
  final Map<String, String> images;
  CardModel({
    required this.code,
    required this.image,
    required this.value,
    required this.suit,
    required this.images,
  });

  CardModel copyWith({
    String? code,
    String? image,
    String? value,
    String? suit,
    Map<String, String>? images,
  }) {
    return CardModel(
      code: code ?? this.code,
      image: image ?? this.image,
      value: value ?? this.value,
      suit: suit ?? this.suit,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'image': image,
      'value': value,
      'suit': suit,
      'images': images,
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      code: map['code'] as String,
      image: map['image'] as String,
      value: map['value'] as String,
      suit: map['suit'] as String,
      images: Map<String, String>.from(map['images'] as Map<String, String>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      code: json['code'],
      image: json['image'],
      value: json['value'],
      suit: json['suit'],
      images: Map<String, String>.from(json['images']),
    );
  }

  @override
  String toString() {
    return 'CardModel(code: $code, image: $image, value: $value, suit: $suit, images: $images)';
  }

  @override
  bool operator ==(covariant CardModel other) {
    if (identical(this, other)) return true;

    return other.code == code &&
        other.image == image &&
        other.value == value &&
        other.suit == suit &&
        mapEquals(other.images, images);
  }

  @override
  int get hashCode {
    return code.hashCode ^
        image.hashCode ^
        value.hashCode ^
        suit.hashCode ^
        images.hashCode;
  }
}
