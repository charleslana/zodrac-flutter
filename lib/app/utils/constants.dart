const String apiBaseUrl =
    'https://zodrac-api.herokuapp.com'; //http://localhost:8081
const String appVersion = '1.0.0';

const String splashScreenImage = 'assets/images/layout/splash_screen.png';
const String bgLargeImage = 'assets/images/layout/bg-large.jpg';
const String logoImage = 'assets/images/layout/logo.png';

String getCharacterImage(String gender, String image) {
  return 'assets/images/avatars/${gender.toLowerCase()}/$image.png';
}

String getElementImage(String element) {
  return 'assets/images/elements/${element.toLowerCase()}.png';
}
