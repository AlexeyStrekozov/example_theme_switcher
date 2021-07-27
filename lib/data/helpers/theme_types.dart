enum ThemeType { dark, light, byDevice }

String themeName(ThemeType themeType) {
  switch (themeType) {
    case ThemeType.dark:
      return "Dark Theme";
    case ThemeType.light:
      return "Light Theme";
    case ThemeType.byDevice:
      return "Follow the system settings";
  }
}
