class SegmentInfo {

  // Public methods and properties

  final String? id;
  final String title;
  final String description;
  final int? minWalletAgeInDays;
  final int? maxWalletAgeInDays;
  final int? transactionsCountPeriodInDays;
  final int? minTransactionsCountPerPeriod;
  final int? maxTransactionsCountPerPeriod;
  final String? utmSource;
  final String? utmMedium;
  final String? utmCampaign;
  final double? minPortfolioBalanceInUSD;
  final double? maxPortfolioBalanceInUSD;

  SegmentInfo({
    required this.title,
    required this.description,
    this.id,
    this.minWalletAgeInDays,
    this.maxWalletAgeInDays,
    this.transactionsCountPeriodInDays,
    this.minTransactionsCountPerPeriod,
    this.maxTransactionsCountPerPeriod,
    this.utmSource,
    this.utmMedium,
    this.utmCampaign,
    this.minPortfolioBalanceInUSD,
    this.maxPortfolioBalanceInUSD
  });

}