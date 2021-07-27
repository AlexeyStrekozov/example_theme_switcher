import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/helpers/theme_types.dart';
import 'package:rick_and_morty/theme/app_text_styles.dart';
import 'package:rick_and_morty/theme/rick_morty_icons.dart';
import 'package:rick_and_morty/theme/theme_manager.dart';
import 'package:provider/provider.dart';

class MainFragment extends StatelessWidget {
  const MainFragment({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Container(
          margin: EdgeInsets.only(top: 20, left: 30),
          height: 37,
          child: _Appearance()),
    );
  }
}

class _Appearance extends StatelessWidget {
  const _Appearance({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showChangeThemeDialog(context),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Row(
        children: [
          Icon(RickMorty.color_palette),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "The Color Theme of the app",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(
                themeName(
                  Provider.of<ThemeNotifier>(context).getThemeType(),
                ),
                style: AppTextStyles.subTitle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<void> showChangeThemeDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return _ChangeTheme();
    },
  );
}

class _ChangeTheme extends StatelessWidget {
  const _ChangeTheme({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeVM = Provider.of<ThemeNotifier>(context);
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "The Color theme of the app",
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 24),
            RadioListTile<ThemeType>(
              title: Text(
                "Dark theme",
              ),
              value: ThemeType.dark,
              groupValue: themeVM.getThemeType(),
              onChanged: (value) => themeVM.setThemeStyle(value),
            ),
            RadioListTile<ThemeType>(
              title: Text(
                "Light theme",
              ),
              value: ThemeType.light,
              groupValue: themeVM.getThemeType(),
              onChanged: (value) => themeVM.setThemeStyle(value),
            ),
            RadioListTile<ThemeType>(
              title: Text(
                "Follow the System Settings",
              ),
              value: ThemeType.byDevice,
              groupValue: themeVM.getThemeType(),
              onChanged: (value) => themeVM.setThemeStyle(value),
            ),
          ],
        ),
      ),
    );
  }
}
