import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../infra/infra.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    // Modular.setNavigatorKey(NavigationService.navigatorKey);
    return LayoutBuilder(
      builder: ((context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig(
              designScreenWidth: 375,
              designScreenHeight: 812,
            ).init(constraints, orientation);
            return MaterialApp.router(
              title: 'TicTacToe ML App',
              theme: ThemeData(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                primarySwatch: Colors.green,
                appBarTheme: const AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle.dark,
                ),
                scaffoldBackgroundColor: Colors.white,
              ),
              debugShowCheckedModeBanner: false,
              routerDelegate: Modular.routerDelegate,
              routeInformationParser: Modular.routeInformationParser,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('pt', 'BR'),
              ],
            );
          },
        );
      }),
    );
  }
}
