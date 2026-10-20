class OnboardingModel {
  String? image;
  String? icon;
  String? title;
  String? description;
}

final List<OnboardingModel> onboardingData = [
  OnboardingModel()
    ..image = 'assets/images/first-boarding.png'
    ..icon = 'assets/icons/order-icon.svg'
    ..title = 'Order for Food'
    ..description = 'Lorem ipsum dolor sit amet, conse ctetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna.',
  OnboardingModel()
    ..image = 'assets/images/second-boarding.png'
    ..icon = 'assets/icons/visa-icon.svg'
    ..title = 'Easy Payment'
    ..description = 'Lorem ipsum dolor sit amet, conse ctetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna.',
  OnboardingModel()
    ..image = 'assets/images/third-boarding.png'
    ..icon = 'assets/icons/order-icon.svg'
    ..title = 'Fast Delivery'
    ..description = 'Lorem ipsum dolor sit amet, conse ctetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna.',
];
