import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
  void pop() => Navigator.of(this).pop();
 //void pop<T extends Object?>([T? result]) =>
   // Navigator.of(this).pop(result);
  void pushNamed(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushNamed(routeName, arguments: arguments);
  void pushReplacementNamed(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  void pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) => Navigator.of(
    this,
  ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);

  void pushNamedAndRemoveAll(String routeName, {Object? arguments}) =>
      Navigator.of(
        this,
      ).pushNamedAndRemoveUntil(routeName, (_) => false, arguments: arguments);
}

extension StringExtension on String? {
  bool get  isNullOrEmpty => this == null || this!.isEmpty;
}

extension ListExtension<T> on List<T>? {
  bool  get isNullOrEmpty => this == null || this!.isEmpty;
}

extension MapExtension<K, V> on Map<K, V>? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}

extension WidgetExtension on Widget {
  Widget withPadding(
    EdgeInsets padding,
  ) {
    return Padding(
      padding: padding,
      child: this,
    );
  }
}


extension ContextExtension
    on BuildContext {

  Size get size =>
      MediaQuery.sizeOf(this);
}