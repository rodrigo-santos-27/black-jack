// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ChipHover {
  bool allHover;
  Map<String, bool> currentHover;
  ChipHover({
    required this.allHover,
    required this.currentHover,
  });

  ChipHover copyWith({
    bool? allHover,
    Map<String, bool>? currentHover,
  }) {
    return ChipHover(
      allHover: allHover ?? this.allHover,
      currentHover: currentHover ?? this.currentHover,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allHover': allHover,
      'currentHover': currentHover,
    };
  }

  factory ChipHover.fromMap(Map<String, dynamic> map) {
    return ChipHover(
      allHover: map['allHover'] as bool,
      currentHover:
          Map<String, bool>.from(map['currentHover'] as Map<String, bool>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChipHover.fromJson(String source) =>
      ChipHover.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ChipHover(allHover: $allHover, currentHover: $currentHover)';

  @override
  bool operator ==(covariant ChipHover other) {
    if (identical(this, other)) return true;

    return other.allHover == allHover &&
        mapEquals(other.currentHover, currentHover);
  }

  @override
  int get hashCode => allHover.hashCode ^ currentHover.hashCode;
}
