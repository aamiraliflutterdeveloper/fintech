import 'package:fintech_app/constants/assets_path.dart';

class SliderModel {
  String? title;
  String? desc;
  String? image;
  SliderModel({this.title, this.image, this.desc});
}

List<SliderModel> slider_data = [
  SliderModel(
      title: 'Send Money',
      desc: 'Send money to friend and your family',
      image: AssetsPath.sendMoney),
  SliderModel(
      title: 'Earn Rewards',
      desc: 'Earn rewards as you use the app',
      image: AssetsPath.earnReward),
  SliderModel(
      title: 'Marketplace',
      desc: 'Easy marketplace payments',
      image: AssetsPath.marketPlace),
  SliderModel(
      title: 'Security',
      desc: 'Banking Security protecting you',
      image: AssetsPath.security),
];
