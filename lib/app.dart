import 'package:flutter/material.dart';
import 'package:foode/config/router/app_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'core/constans/app_colors.dart';

class Foode extends StatelessWidget {
  const Foode({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, type) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: ThemeData(
          checkboxTheme: const CheckboxThemeData(
            side: BorderSide(color: AppColors.pink, width: 1.5),
          ),
          textTheme: GoogleFonts.sourceSans3TextTheme(),
        ),
      ),
    );
  }
}
