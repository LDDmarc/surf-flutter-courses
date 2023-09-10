enum AppTheme {
  system, light, dark
}

extension AppThemeExtension on AppTheme {
  String get name {
    switch (this) {
      case AppTheme.system:
        return "Системная";
      case AppTheme.light:
        return "Светлая";
      case AppTheme.dark:
        return "Темная";
    }
  }
}