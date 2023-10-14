// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PanelButton {
  String name;
  String pathUp;
  String pathDown;
  PanelButton({
    required this.name,
    required this.pathUp,
    required this.pathDown,
  });

  PanelButton copyWith({
    String? name,
    String? pathUp,
    String? pathDown,
  }) {
    return PanelButton(
      name: name ?? this.name,
      pathUp: pathUp ?? this.pathUp,
      pathDown: pathDown ?? this.pathDown,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'pathUp': pathUp,
      'pathDown': pathDown,
    };
  }

  factory PanelButton.fromMap(Map<String, dynamic> map) {
    return PanelButton(
      name: map['name'] as String,
      pathUp: map['pathUp'] as String,
      pathDown: map['pathDown'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PanelButton.fromJson(String source) =>
      PanelButton.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PanelButton(name: $name, pathUp: $pathUp, pathDown: $pathDown)';

  @override
  bool operator ==(covariant PanelButton other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.pathUp == pathUp &&
        other.pathDown == pathDown;
  }

  @override
  int get hashCode => name.hashCode ^ pathUp.hashCode ^ pathDown.hashCode;
}
