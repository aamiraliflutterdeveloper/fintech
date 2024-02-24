
import 'package:fintech_app/constants/assets_path.dart';






List<MyFintechData> myFintechDataList = [
  MyFintechData(title: 'Transfers', path: AssetsPath.IC_TRANSFER),
  MyFintechData(title: 'Deposits', path: AssetsPath.IC_DEPOSIT),
  MyFintechData(title: 'Pay Bills', path: AssetsPath.IC_PAY_BILL),
  MyFintechData(title: 'Payments', path: AssetsPath.IC_PAYMENTS),
  MyFintechData(title: 'Transactions', path: AssetsPath.IC_TRANSACTIONS),
];



class MyFintechData{

  String title;
  String path;

  MyFintechData({required this.title , required this.path});

}