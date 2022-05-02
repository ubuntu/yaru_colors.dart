import 'palette.dart';

class MaterialColors {
  const MaterialColors._();

  static const values = [
    red,
    pink,
    purple,
    deepPurple,
    indigo,
    blue,
    lightBlue,
    cyan,
    teal,
    green,
    lightGreen,
    lime,
    yellow,
    amber,
    orange,
    deepOrange,
    brown,
    grey,
    blueGrey,
  ];

  static const Palette red = {
    0: _redPrimary,
    50: 0xFFFFEBEE,
    100: 0xFFFFCDD2,
    200: 0xFFEF9A9A,
    300: 0xFFE57373,
    400: 0xFFEF5350,
    500: _redPrimary,
    600: 0xFFE53935,
    700: 0xFFD32F2F,
    800: 0xFFC62828,
    900: 0xFFB71C1C,
  };
  static const _redPrimary = 0xFFF44336;

  static const Palette pink = {
    0: _pinkPrimary,
    50: 0xFFFCE4EC,
    100: 0xFFF8BBD0,
    200: 0xFFF48FB1,
    300: 0xFFF06292,
    400: 0xFFEC407A,
    500: _pinkPrimary,
    600: 0xFFD81B60,
    700: 0xFFC2185B,
    800: 0xFFAD1457,
    900: 0xFF880E4F,
  };
  static const _pinkPrimary = 0xFFE91E63;

  static const Palette purple = {
    0: _purplePrimary,
    50: 0xFFF3E5F5,
    100: 0xFFE1BEE7,
    200: 0xFFCE93D8,
    300: 0xFFBA68C8,
    400: 0xFFAB47BC,
    500: _purplePrimary,
    600: 0xFF8E24AA,
    700: 0xFF7B1FA2,
    800: 0xFF6A1B9A,
    900: 0xFF4A148C,
  };
  static const _purplePrimary = 0xFF9C27B0;

  static const Palette deepPurple = {
    0: _deepPurplePrimary,
    50: 0xFFEDE7F6,
    100: 0xFFD1C4E9,
    200: 0xFFB39DDB,
    300: 0xFF9575CD,
    400: 0xFF7E57C2,
    500: _deepPurplePrimary,
    600: 0xFF5E35B1,
    700: 0xFF512DA8,
    800: 0xFF4527A0,
    900: 0xFF311B92,
  };
  static const _deepPurplePrimary = 0xFF673AB7;

  static const Palette indigo = {
    0: _indigoPrimary,
    50: 0xFFE8EAF6,
    100: 0xFFC5CAE9,
    200: 0xFF9FA8DA,
    300: 0xFF7986CB,
    400: 0xFF5C6BC0,
    500: _indigoPrimary,
    600: 0xFF3949AB,
    700: 0xFF303F9F,
    800: 0xFF283593,
    900: 0xFF1A237E,
  };
  static const _indigoPrimary = 0xFF3F51B5;

  static const Palette blue = {
    0: _bluePrimary,
    50: 0xFFE3F2FD,
    100: 0xFFBBDEFB,
    200: 0xFF90CAF9,
    300: 0xFF64B5F6,
    400: 0xFF42A5F5,
    500: _bluePrimary,
    600: 0xFF1E88E5,
    700: 0xFF1976D2,
    800: 0xFF1565C0,
    900: 0xFF0D47A1,
  };
  static const _bluePrimary = 0xFF2196F3;

  static const Palette lightBlue = {
    0: _lightBluePrimary,
    50: 0xFFE1F5FE,
    100: 0xFFB3E5FC,
    200: 0xFF81D4FA,
    300: 0xFF4FC3F7,
    400: 0xFF29B6F6,
    500: _lightBluePrimary,
    600: 0xFF039BE5,
    700: 0xFF0288D1,
    800: 0xFF0277BD,
    900: 0xFF01579B,
  };
  static const _lightBluePrimary = 0xFF03A9F4;

  static const Palette cyan = {
    0: _cyanPrimary,
    50: 0xFFE0F7FA,
    100: 0xFFB2EBF2,
    200: 0xFF80DEEA,
    300: 0xFF4DD0E1,
    400: 0xFF26C6DA,
    500: _cyanPrimary,
    600: 0xFF00ACC1,
    700: 0xFF0097A7,
    800: 0xFF00838F,
    900: 0xFF006064,
  };
  static const _cyanPrimary = 0xFF00BCD4;

  static const Palette teal = {
    0: _tealPrimary,
    50: 0xFFE0F2F1,
    100: 0xFFB2DFDB,
    200: 0xFF80CBC4,
    300: 0xFF4DB6AC,
    400: 0xFF26A69A,
    500: _tealPrimary,
    600: 0xFF00897B,
    700: 0xFF00796B,
    800: 0xFF00695C,
    900: 0xFF004D40,
  };
  static const _tealPrimary = 0xFF009688;

  static const Palette green = {
    0: _greenPrimary,
    50: 0xFFE8F5E9,
    100: 0xFFC8E6C9,
    200: 0xFFA5D6A7,
    300: 0xFF81C784,
    400: 0xFF66BB6A,
    500: _greenPrimary,
    600: 0xFF43A047,
    700: 0xFF388E3C,
    800: 0xFF2E7D32,
    900: 0xFF1B5E20,
  };
  static const _greenPrimary = 0xFF4CAF50;

  static const Palette lightGreen = {
    0: _lightGreenPrimary,
    50: 0xFFF1F8E9,
    100: 0xFFDCEDC8,
    200: 0xFFC5E1A5,
    300: 0xFFAED581,
    400: 0xFF9CCC65,
    500: _lightGreenPrimary,
    600: 0xFF7CB342,
    700: 0xFF689F38,
    800: 0xFF558B2F,
    900: 0xFF33691E,
  };
  static const _lightGreenPrimary = 0xFF8BC34A;

  static const Palette lime = {
    0: _limePrimary,
    50: 0xFFF9FBE7,
    100: 0xFFF0F4C3,
    200: 0xFFE6EE9C,
    300: 0xFFDCE775,
    400: 0xFFD4E157,
    500: _limePrimary,
    600: 0xFFC0CA33,
    700: 0xFFAFB42B,
    800: 0xFF9E9D24,
    900: 0xFF827717,
  };
  static const _limePrimary = 0xFFCDDC39;

  static const Palette yellow = {
    0: _yellowPrimary,
    50: 0xFFFFFDE7,
    100: 0xFFFFF9C4,
    200: 0xFFFFF59D,
    300: 0xFFFFF176,
    400: 0xFFFFEE58,
    500: _yellowPrimary,
    600: 0xFFFDD835,
    700: 0xFFFBC02D,
    800: 0xFFF9A825,
    900: 0xFFF57F17,
  };
  static const _yellowPrimary = 0xFFFFEB3B;

  static const Palette amber = {
    0: _amberPrimary,
    50: 0xFFFFF8E1,
    100: 0xFFFFECB3,
    200: 0xFFFFE082,
    300: 0xFFFFD54F,
    400: 0xFFFFCA28,
    500: _amberPrimary,
    600: 0xFFFFB300,
    700: 0xFFFFA000,
    800: 0xFFFF8F00,
    900: 0xFFFF6F00,
  };
  static const _amberPrimary = 0xFFFFC107;

  static const Palette orange = {
    0: _orangePrimary,
    50: 0xFFFFF3E0,
    100: 0xFFFFE0B2,
    200: 0xFFFFCC80,
    300: 0xFFFFB74D,
    400: 0xFFFFA726,
    500: _orangePrimary,
    600: 0xFFFB8C00,
    700: 0xFFF57C00,
    800: 0xFFEF6C00,
    900: 0xFFE65100,
  };
  static const _orangePrimary = 0xFFFF9800;

  static const Palette deepOrange = {
    0: _deepOrangePrimary,
    50: 0xFFFBE9E7,
    100: 0xFFFFCCBC,
    200: 0xFFFFAB91,
    300: 0xFFFF8A65,
    400: 0xFFFF7043,
    500: _deepOrangePrimary,
    600: 0xFFF4511E,
    700: 0xFFE64A19,
    800: 0xFFD84315,
    900: 0xFFBF360C,
  };
  static const _deepOrangePrimary = 0xFFFF5722;

  static const Palette brown = {
    0: _brownPrimary,
    50: 0xFFEFEBE9,
    100: 0xFFD7CCC8,
    200: 0xFFBCAAA4,
    300: 0xFFA1887F,
    400: 0xFF8D6E63,
    500: _brownPrimary,
    600: 0xFF6D4C41,
    700: 0xFF5D4037,
    800: 0xFF4E342E,
    900: 0xFF3E2723,
  };
  static const _brownPrimary = 0xFF795548;

  static const Palette grey = {
    0: _greyPrimary,
    50: 0xFFFAFAFA,
    100: 0xFFF5F5F5,
    200: 0xFFEEEEEE,
    300: 0xFFE0E0E0,
    400: 0xFFBDBDBD,
    500: _greyPrimary,
    600: 0xFF757575,
    700: 0xFF616161,
    800: 0xFF424242,
    900: 0xFF212121,
  };
  static const int _greyPrimary = 0xFF9E9E9E;

  static const Palette blueGrey = {
    0: _blueGreyPrimary,
    50: 0xFFECEFF1,
    100: 0xFFCFD8DC,
    200: 0xFFB0BEC5,
    300: 0xFF90A4AE,
    400: 0xFF78909C,
    500: _blueGreyPrimary,
    600: 0xFF546E7A,
    700: 0xFF455A64,
    800: 0xFF37474F,
    900: 0xFF263238,
  };
  static const _blueGreyPrimary = 0xFF607D8B;
}
