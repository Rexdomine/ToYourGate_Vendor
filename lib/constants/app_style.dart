import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static poppinsText({fontWeight, double? size, decoration, color}) =>
      GoogleFonts.poppins(
          fontSize: size,
          fontWeight: fontWeight,
          color: color,
          decoration: decoration);
}
