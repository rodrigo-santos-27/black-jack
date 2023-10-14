// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CardModel {
  final String image;
  final String value;
  final String suit;
  final String code;
  CardModel({
    required this.image,
    required this.value,
    required this.suit,
    required this.code,
  });

  CardModel copyWith({
    String? image,
    String? value,
    String? suit,
    String? code,
  }) {
    return CardModel(
      image: image ?? this.image,
      value: value ?? this.value,
      suit: suit ?? this.suit,
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'value': value,
      'suit': suit,
      'code': code,
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      image: map['image'] as String,
      value: map['value'] as String,
      suit: map['suit'] as String,
      code: map['code'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CardModel.fromJson(String source) =>
      CardModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CardModel(image: $image, value: $value, suit: $suit, code: $code)';
  }

  @override
  bool operator ==(covariant CardModel other) {
    if (identical(this, other)) return true;

    return other.image == image &&
        other.value == value &&
        other.suit == suit &&
        other.code == code;
  }

  @override
  int get hashCode {
    return image.hashCode ^ value.hashCode ^ suit.hashCode ^ code.hashCode;
  }
}
