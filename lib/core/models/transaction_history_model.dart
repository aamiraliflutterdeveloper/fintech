class TransactionHistoryModel {
  final String date;
  final String amount;
  final bool? isDebit;
  final String phone;
  final String providerName;

  TransactionHistoryModel({
    required this.date,
    required this.amount,
    this.isDebit = false,
    required this.phone,
    required this.providerName,
  });
}

List<TransactionHistoryModel> transaction_history_data = [
  TransactionHistoryModel(
    date: '09',
    amount: '100000.00',
    isDebit: true,
    phone: '03XXXXXXXXX',
    providerName: 'FinTech Mobile',
  ),
  TransactionHistoryModel(
    date: '10',
    amount: '300000.00',
    phone: '03XXXXXXXXX',
    providerName: 'Bank AL Habeeb',
  ),
  TransactionHistoryModel(
    date: '11',
    amount: '200000.00',
    isDebit: true,
    phone: '03XXXXXXXXX',
    providerName: 'FinTech Mobile',
  ),
  TransactionHistoryModel(
    date: '12',
    amount: '400000.00',
    phone: '03XXXXXXXXX',
    providerName: 'Bank AL Habeeb',
  ),
  TransactionHistoryModel(
    date: '13',
    amount: '700000.00',
    isDebit: true,
    phone: '03XXXXXXXXX',
    providerName: 'FinTech Mobile',
  ),
  TransactionHistoryModel(
    date: '14',
    amount: '100000.00',
    phone: '03XXXXXXXXX',
    providerName: 'Bank AL Habeeb',
  ),
  TransactionHistoryModel(
    date: '09',
    amount: '100000.00',
    isDebit: true,
    phone: '03XXXXXXXXX',
    providerName: 'FinTech Mobile',
  ),
  TransactionHistoryModel(
    date: '10',
    amount: '300000.00',
    phone: '03XXXXXXXXX',
    providerName: 'Bank AL Habeeb',
  ),
  TransactionHistoryModel(
    date: '11',
    amount: '200000.00',
    isDebit: true,
    phone: '03XXXXXXXXX',
    providerName: 'FinTech Mobile',
  ),
  TransactionHistoryModel(
    date: '12',
    amount: '400000.00',
    phone: '03XXXXXXXXX',
    providerName: 'Bank AL Habeeb',
  ),
  TransactionHistoryModel(
    date: '13',
    amount: '700000.00',
    isDebit: true,
    phone: '03XXXXXXXXX',
    providerName: 'FinTech Mobile',
  ),
  TransactionHistoryModel(
    date: '14',
    amount: '100000.00',
    phone: '03XXXXXXXXX',
    providerName: 'Bank AL Habeeb',
  ),
  TransactionHistoryModel(
    date: '10',
    amount: '300000.00',
    phone: '03XXXXXXXXX',
    providerName: 'Bank AL Habeeb',
  ),
  TransactionHistoryModel(
    date: '11',
    amount: '200000.00',
    isDebit: true,
    phone: '03XXXXXXXXX',
    providerName: 'FinTech Mobile',
  ),
  TransactionHistoryModel(
    date: '12',
    amount: '400000.00',
    phone: '03XXXXXXXXX',
    providerName: 'Bank AL Habeeb',
  ),
  TransactionHistoryModel(
    date: '13',
    amount: '700000.00',
    isDebit: true,
    phone: '03XXXXXXXXX',
    providerName: 'FinTech Mobile',
  ),
  TransactionHistoryModel(
    date: '14',
    amount: '100000.00',
    phone: '03XXXXXXXXX',
    providerName: 'Bank AL Habeeb',
  ),
];
