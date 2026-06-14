import 'package:flutter/material.dart';

/// Provides the active [Locale] and a callback to change it to all descendants.
/// Mirrors the ThemeScope/ThemeController pattern used for dark-mode switching.
class LocaleScope extends InheritedWidget {
  const LocaleScope({
    super.key,
    required this.locale,
    required this.onLocaleChange,
    required super.child,
  });

  final Locale locale;
  final ValueChanged<Locale> onLocaleChange;

  static LocaleScope of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<LocaleScope>()!;

  @override
  bool updateShouldNotify(LocaleScope old) => locale != old.locale;
}
