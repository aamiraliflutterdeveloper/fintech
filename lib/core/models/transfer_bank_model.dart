import 'package:fintech_app/constants/assets_path.dart';

class TransferBankModel {
  String? name;
  String? image;

  TransferBankModel({this.name, this.image});
}

List<TransferBankModel> transfer_to_bank_data = [
  TransferBankModel(name: 'Habib Bank Limited', image: AssetsPath.IC_HBL),
  TransferBankModel(name: 'Bank Alfalah Limited', image: AssetsPath.IC_BAF),
  TransferBankModel(name: 'Allied Bank Limited', image: AssetsPath.IC_ABL),
  TransferBankModel(name: 'Askari Bank', image: AssetsPath.IC_ASKRI),
  TransferBankModel(name: 'Bank Al-Habib Limited', image: AssetsPath.IC_BAH),
  TransferBankModel(name: 'United Bank Limited', image: AssetsPath.IC_UBL),
];
