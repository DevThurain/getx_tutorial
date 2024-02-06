import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';
import 'package:getx_tutorial/app/binding/initial_binding.dart';
import 'package:getx_tutorial/app/modules/counter/counter_page.dart';
import 'package:getx_tutorial/app/modules/main/main_page.dart';
import 'package:getx_tutorial/app/routes/app_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
      ],
      initialBinding: InitialBinding(),
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,

      onGenerateTitle: (BuildContext context) => AppLocalizations.of(context)!.appTitle,

      // Define a light and dark color theme. Then, read the user's
      // preferred ThemeMode (light, dark, or system default) from the
      // SettingsController to display the correct theme.
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,

      // Define a function to handle named routes in order to support
      // Flutter web url navigation and deep linking.
    );
  }
}
