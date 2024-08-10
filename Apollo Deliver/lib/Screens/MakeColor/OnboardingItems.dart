import 'package:apollodeliver/Screens/MakeColor/OnboardingInfo.dart';

class OnboardingItems{
  List<OnboardingInfo> items = [
    OnboardingInfo(
        title: "Welcome to Apollo",
        descriptions: "Apollo Delivery App from Apollo Company",
        image: "assets/images/logoBlack.png"),

    OnboardingInfo(
        title: "Safe Packing",
        descriptions: "There is little you can do to stop a tornado, a hurricane, "
            "or a cancer diagnosis from changing your life in an instant.",
        image: "assets/images/packing.gif"),

    OnboardingInfo(
        title: "Fast Delivery",
        descriptions: "A healthy heart is a key to happiness in life so put a stop to all of the problems related to your heart before it stops you.",
        image: "assets/images/delivery-car.gif"),
  ];
}