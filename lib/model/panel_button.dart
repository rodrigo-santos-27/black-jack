import 'package:app/utils/enums.dart';

class PanelButton {
  final String name;
  final String pathUp;
  final String pathDown;
  final BlackjackPanelAction action;

  PanelButton({
    required this.name,
    required this.pathUp,
    required this.pathDown,
    required this.action,
  });

  PanelButton copyWith({
    String? name,
    String? pathUp,
    String? pathDown,
    BlackjackPanelAction? action,
  }) {
    return PanelButton(
      name: name ?? this.name,
      pathUp: pathUp ?? this.pathUp,
      pathDown: pathDown ?? this.pathDown,
      action: action ?? this.action,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'pathUp': pathUp,
      'pathDown': pathDown,
      'action': action.toString().split('.').last, // Convert enum to string
    };
  }

  factory PanelButton.fromMap(Map<String, dynamic> map) {
    return PanelButton(
      name: map['name'] as String,
      pathUp: map['pathUp'] as String,
      pathDown: map['pathDown'] as String,
      action: BlackjackPanelAction.values
          .firstWhere((e) => e.toString().split('.').last == map['action']),
    );
  }

  @override
  String toString() {
    return 'PanelButton(name: $name, pathUp: $pathUp, pathDown: $pathDown, action: $action)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PanelButton &&
        other.name == name &&
        other.pathUp == pathUp &&
        other.pathDown == pathDown &&
        other.action == action;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        pathUp.hashCode ^
        pathDown.hashCode ^
        action.hashCode;
  }
}
