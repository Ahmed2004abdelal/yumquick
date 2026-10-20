class StripeAmountHelper {
  StripeAmountHelper._();

  static const Set<String> _zeroDecimalCurrencies = {
    'BIF',
    'CLP',
    'DJF',
    'GNF',
    'JPY',
    'KMF',
    'KRW',
    'MGA',
    'PYG',
    'RWF',
    'UGX',
    'VND',
    'VUV',
    'XAF',
    'XOF',
    'XPF',
  };

  static const Set<String> _threeDecimalCurrencies = {
    'BHD',
    'JOD',
    'KWD',
    'OMR',
    'TND',
  };

  static int toStripeAmount(double amount, String currency) {
    final code = currency.toUpperCase();

    if (_zeroDecimalCurrencies.contains(code)) {
      return amount.round();
    }

    if (_threeDecimalCurrencies.contains(code)) {
      return (amount * 100).round() * 10;
    }

    return (amount * 100).round();
  }
}
