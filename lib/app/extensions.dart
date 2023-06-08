import 'package:currency_app/app/constants.dart';
import 'package:flutter/material.dart';

extension NonNullString on String? {
  String orEmpty() {
    return (this == null) ? Constants.empty : this!;
  }
}

extension NonNullInt on int? {
  int orZero() {
    return (this == null) ? Constants.zero : this!;
  }
}

extension NonNullDouble on double? {
  double orDouble() {
    return (this == null) ? Constants.doubleZero : this!;
  }
}

extension NonNullBool on bool? {
  bool orFalse() {
    return (this == null) ? Constants.falseValue : this!;
  }
}

extension NonNullMap on Map? {
  Map orEmptyMap() {
    return (this == null) ? Constants.emptyMap : this!;
  }
}

/*extension EitherX<L, R> on Either<L, R> {
  R asRight() => (this as Right).value; //
  L asLeft() => (this as Left).value;
}*/

extension CustomPadding on num {
  SizedBox get ph => SizedBox(
        height: toDouble(),
      );

  SizedBox get pw => SizedBox(
        width: toDouble(),
      );
}
