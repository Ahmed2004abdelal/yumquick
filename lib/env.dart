import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'API_URL', obfuscate: true)
  static String apiUrl = _Env.apiUrl;

  @EnviedField(varName: 'StripePublishableKey', obfuscate: true)
  static String stripePublishableKey = _Env.stripePublishableKey;
}
