import 'package:mix/mix.dart';

extension ColorTokenUtilExt on ColorTokenUtil {
  ColorToken get primary => const ColorToken('primary-color');
  ColorToken get onPrimary => const ColorToken('on-primary-color');
  ColorToken get surface => const ColorToken('surface-color');
  ColorToken get onSurface => const ColorToken('on-surface-color');
  ColorToken get onSurfaceVariant =>
      const ColorToken('on-surface-variant-color');
  ColorToken get cardBackgroundColor =>
      const ColorToken('card-background-color');
}
 
extension TextStyleTokenUtilExt on TextStyleTokenUtil {
  TextStyleToken get headline1 => const TextStyleToken('headline1');
  TextStyleToken get headline2 => const TextStyleToken('headline2');
  TextStyleToken get headline3 => const TextStyleToken('headline3');
  TextStyleToken get body => const TextStyleToken('body');
  TextStyleToken get callout => const TextStyleToken('callout');
}