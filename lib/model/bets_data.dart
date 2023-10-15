// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BetsData {
  String chip;
  int value;
  double offSetX;
  double offSetY;
  BetsData({
    required this.chip,
    required this.value,
    required this.offSetX,
    required this.offSetY,
  });

  BetsData copyWith({
    String? chip,
    int? value,
    double? offSetX,
    double? offSetY,
  }) {
    return BetsData(
      chip: chip ?? this.chip,
      value: value ?? this.value,
      offSetX: offSetX ?? this.offSetX,
      offSetY: offSetY ?? this.offSetY,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'chip': chip,
      'value': value,
      'offSetX': offSetX,
      'offSetY': offSetY,
    };
  }

  factory BetsData.fromMap(Map<String, dynamic> map) {
    return BetsData(
      chip: map['chip'] as String,
      value: map['value'] as int,
      offSetX: map['offSetX'] as double,
      offSetY: map['offSetY'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory BetsData.fromJson(String source) =>
      BetsData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BetsData(chip: $chip, value: $value, offSetX: $offSetX, offSetY: $offSetY)';
  }

  @override
  bool operator ==(covariant BetsData other) {
    if (identical(this, other)) return true;

    return other.chip == chip &&
        other.value == value &&
        other.offSetX == offSetX &&
        other.offSetY == offSetY;
  }

  @override
  int get hashCode {
    return chip.hashCode ^ value.hashCode ^ offSetX.hashCode ^ offSetY.hashCode;
  }
}
