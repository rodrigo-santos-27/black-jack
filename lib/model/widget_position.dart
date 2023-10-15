// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:app/utils/enums.dart';
import 'package:flutter/material.dart';

class WidgetPosition {
  final double? top;
  final double? left;
  final double? right;
  final double? heightImage;
  final double? widthImage;
  final double? heightWidget;
  final double? widthWidget;
  final String? path;
  final Alignment? alignment;
  final BoxFit? fit;
  final CustomEdgeInsets? padding;
  final CustomEdgeInsets? margin;
  final double? widthFactor;
  final double? heightFactor;
  final Positions id;
  final Color? background;
  final double? fontSize;
  WidgetPosition(
      {this.top,
      this.left,
      this.right,
      this.heightImage,
      this.widthImage,
      this.heightWidget,
      this.widthWidget,
      this.path,
      this.alignment,
      this.fit,
      this.padding,
      this.margin,
      this.widthFactor,
      this.heightFactor,
      required this.id,
      this.background,
      this.fontSize});

  WidgetPosition copyWith(
      {double? top,
      double? left,
      double? right,
      double? heightImage,
      double? widthImage,
      double? heightWidget,
      double? widthWidget,
      String? path,
      Alignment? alignment,
      BoxFit? fit,
      EdgeInsetsGeometry? padding,
      EdgeInsetsGeometry? margin,
      double? widthFactor,
      double? heightFactor,
      Positions? id,
      Color? background,
      double? fontSize}) {
    return WidgetPosition(
        top: top ?? this.top,
        left: left ?? this.left,
        right: right ?? this.right,
        heightImage: heightImage ?? this.heightImage,
        widthImage: widthImage ?? this.widthImage,
        heightWidget: heightWidget ?? this.heightWidget,
        widthWidget: widthWidget ?? this.widthWidget,
        path: path ?? this.path,
        alignment: alignment ?? this.alignment,
        fit: fit ?? this.fit,
        padding: this.padding,
        margin: this.margin,
        widthFactor: widthFactor ?? this.widthFactor,
        heightFactor: heightFactor ?? this.heightFactor,
        id: id ?? this.id,
        background: background ?? this.background,
        fontSize: fontSize ?? this.fontSize);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'top': top,
      'left': left,
      'right': right,
      'heightImage': heightImage,
      'widthImage': widthImage,
      'heightWidget': heightWidget,
      'widthWidget': widthWidget,
      'path': path,
      'alignment':
          alignment != null ? {'x': alignment!.x, 'y': alignment!.y} : null,
      'fit': fit?.toString(),
      'padding': padding is CustomEdgeInsets
          ? {
              'left': (padding as CustomEdgeInsets).left,
              'top': (padding as CustomEdgeInsets).top,
              'right': (padding as CustomEdgeInsets).right,
              'bottom': (padding as CustomEdgeInsets).bottom,
            }
          : null,
      'margin': padding is CustomEdgeInsets
          ? {
              'left': (padding as CustomEdgeInsets).left,
              'top': (padding as CustomEdgeInsets).top,
              'right': (padding as CustomEdgeInsets).right,
              'bottom': (padding as CustomEdgeInsets).bottom,
            }
          : null,
      'widthFactor': widthFactor,
      'heightFactor': heightFactor,
      'background': background,
      'fontSize': fontSize
    };
  }

  factory WidgetPosition.fromMap(Map<String, dynamic> map) {
    return WidgetPosition(
      top: map['top'] != null ? map['top'] as double : null,
      left: map['left'] != null ? map['left'] as double : null,
      right: map['right'] != null ? map['right'] as double : null,
      heightImage:
          map['heightImage'] != null ? map['heightImage'] as double : null,
      widthImage:
          map['widthImage'] != null ? map['widthImage'] as double : null,
      heightWidget:
          map['heightWidget'] != null ? map['heightWidget'] as double : null,
      widthWidget:
          map['widthWidget'] != null ? map['widthWidget'] as double : null,
      path: map['path'] != null ? map['path'] as String : null,
      alignment: map['alignment'] != null
          ? Alignment(
              map['alignment']['x'] as double,
              map['alignment']['y'] as double,
            )
          : null,
      fit: map['fit'] != null
          ? BoxFit.values
              .firstWhere((e) => e.toString() == 'BoxFit.${map['fit']}')
          : null,
      padding: map['padding'] != null
          ? CustomEdgeInsets.only(
              left: (map['padding']['left'] ?? 0) as double,
              top: (map['padding']['top'] ?? 0) as double,
              right: (map['padding']['right'] ?? 0) as double,
              bottom: (map['padding']['bottom'] ?? 0) as double,
            )
          : null,
      margin: map['margin'] != null
          ? CustomEdgeInsets.only(
              left: (map['margin']['left'] ?? 0) as double,
              top: (map['margin']['top'] ?? 0) as double,
              right: (map['margin']['right'] ?? 0) as double,
              bottom: (map['margin']['bottom'] ?? 0) as double,
            )
          : null,
      widthFactor:
          map['widthFactor'] != null ? map['widthFactor'] as double : null,
      heightFactor:
          map['heightFactor'] != null ? map['heightFactor'] as double : null,
      id: Positions.values[map['id']],
      background: map['background'] != null ? map['background'] as Color : null,
      fontSize: map['fontSize'] != null ? map['fontSize'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WidgetPosition.fromJson(String source) =>
      WidgetPosition.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WidgetPosition(top: $top, left: $left, right: $right, heightImage: $heightImage, widthImage: $widthImage, heightWidget: $heightWidget, widthWidget: $widthWidget, path: $path, alignment: $alignment, fit: $fit, padding: $padding, margin: $margin, widthFactor: $widthFactor, heightFactor: $heightFactor, id: $id, background: $background, fontSize: $fontSize)';
  }

  @override
  bool operator ==(covariant WidgetPosition other) {
    if (identical(this, other)) return true;

    return other.top == top &&
        other.left == left &&
        other.right == right &&
        other.heightImage == heightImage &&
        other.widthImage == widthImage &&
        other.heightWidget == heightWidget &&
        other.widthWidget == widthWidget &&
        other.path == path &&
        other.alignment == alignment &&
        other.fit == fit &&
        other.padding == padding &&
        other.margin == margin &&
        other.widthFactor == widthFactor &&
        other.heightFactor == heightFactor &&
        other.id == id &&
        other.background == background &&
        other.fontSize == fontSize;
  }

  @override
  int get hashCode {
    return top.hashCode ^
        left.hashCode ^
        right.hashCode ^
        heightImage.hashCode ^
        widthImage.hashCode ^
        heightWidget.hashCode ^
        widthWidget.hashCode ^
        path.hashCode ^
        alignment.hashCode ^
        fit.hashCode ^
        padding.hashCode ^
        margin.hashCode ^
        widthFactor.hashCode ^
        heightFactor.hashCode ^
        id.hashCode ^
        background.hashCode ^
        fontSize.hashCode;
  }
}

class CustomEdgeInsets {
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  CustomEdgeInsets({
    this.left,
    this.right,
    this.top,
    this.bottom,
  });

  CustomEdgeInsets copyWith({
    double? left,
    double? right,
    double? top,
    double? bottom,
  }) {
    return CustomEdgeInsets(
      left: left ?? this.left,
      right: right ?? this.right,
      top: top ?? this.top,
      bottom: bottom ?? this.bottom,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'left': left,
      'right': right,
      'top': top,
      'bottom': bottom,
    };
  }

  factory CustomEdgeInsets.fromMap(Map<String, dynamic> map) {
    return CustomEdgeInsets(
      left: map['left'] != null ? map['left'] as double : null,
      right: map['right'] != null ? map['right'] as double : null,
      top: map['top'] != null ? map['top'] as double : null,
      bottom: map['bottom'] != null ? map['bottom'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomEdgeInsets.fromJson(String source) =>
      CustomEdgeInsets.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CustomEdgeInsets(left: $left, right: $right, top: $top, bottom: $bottom)';
  }

  @override
  bool operator ==(covariant CustomEdgeInsets other) {
    if (identical(this, other)) return true;

    return other.left == left &&
        other.right == right &&
        other.top == top &&
        other.bottom == bottom;
  }

  @override
  int get hashCode {
    return left.hashCode ^ right.hashCode ^ top.hashCode ^ bottom.hashCode;
  }

  static only(
      {required double left,
      required double top,
      required double right,
      required double bottom}) {}
}
