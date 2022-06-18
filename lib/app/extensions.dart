import 'constants.dart';

extension NonNullString on String? {
  String orEmpty() {
    return this ?? "";
  }
}

extension NonNullInteger on int? {
  int orZero() {
    return this ?? Constants.zero;
  }
}

extension NonNullList on List? {
  List orEmpty() {
    return this ?? List.empty();
  }
}

extension NonNullBoolean on bool? {
  bool orFalse() {
    return this ?? false;
  }
}
