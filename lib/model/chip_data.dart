// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class ChipData {
  final double topFactor;
  final double sideLeftFactor;
  final double sideRightFactor;
  final double offSetHeight;
  final double offSetWidth;
  final double offSetGlow;
  final Color glow;
  final String imagePath;
  ChipData({
    required this.topFactor,
    required this.sideLeftFactor,
    required this.sideRightFactor,
    required this.offSetHeight,
    required this.offSetWidth,
    required this.offSetGlow,
    required this.glow,
    required this.imagePath,
  });

  ChipData copyWith({
    double? topFactor,
    double? sideLeftFactor,
    double? sideRightFactor,
    double? offSetHeight,
    double? offSetWidth,
    double? offSetGlow,
    Color? glow,
    String? imagePath,
  }) {
    return ChipData(
      topFactor: topFactor ?? this.topFactor,
      sideLeftFactor: sideLeftFactor ?? this.sideLeftFactor,
      sideRightFactor: sideRightFactor ?? this.sideRightFactor,
      offSetHeight: offSetHeight ?? this.offSetHeight,
      offSetWidth: offSetWidth ?? this.offSetWidth,
      offSetGlow: offSetGlow ?? this.offSetGlow,
      glow: glow ?? this.glow,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'topFactor': topFactor,
      'sideLeftFactor': sideLeftFactor,
      'sideRightFactor': sideRightFactor,
      'offSetHeight': offSetHeight,
      'offSetWidth': offSetWidth,
      'offSetGlow': offSetGlow,
      'glow': glow.value,
      'imagePath': imagePath,
    };
  }

  factory ChipData.fromMap(Map<String, dynamic> map) {
    return ChipData(
      topFactor: map['topFactor'] as double,
      sideLeftFactor: map['sideLeftFactor'] as double,
      sideRightFactor: map['sideRightFactor'] as double,
      offSetHeight: map['offSetHeight'] as double,
      offSetWidth: map['offSetWidth'] as double,
      offSetGlow: map['offSetGlow'] as double,
      glow: Color(map['glow'] as int),
      imagePath: map['imagePath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChipData.fromJson(String source) =>
      ChipData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChipData(topFactor: $topFactor, sideLeftFactor: $sideLeftFactor, sideRightFactor: $sideRightFactor, offSetHeight: $offSetHeight, offSetWidth: $offSetWidth, offSetGlow: $offSetGlow, glow: $glow, imagePath: $imagePath)';
  }

  @override
  bool operator ==(covariant ChipData other) {
    if (identical(this, other)) return true;

    return other.topFactor == topFactor &&
        other.sideLeftFactor == sideLeftFactor &&
        other.sideRightFactor == sideRightFactor &&
        other.offSetHeight == offSetHeight &&
        other.offSetWidth == offSetWidth &&
        other.offSetGlow == offSetGlow &&
        other.glow == glow &&
        other.imagePath == imagePath;
  }

  @override
  int get hashCode {
    return topFactor.hashCode ^
        sideLeftFactor.hashCode ^
        sideRightFactor.hashCode ^
        offSetHeight.hashCode ^
        offSetWidth.hashCode ^
        offSetGlow.hashCode ^
        glow.hashCode ^
        imagePath.hashCode;
  }
}
