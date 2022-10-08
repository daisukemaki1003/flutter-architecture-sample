enum OccupatioEenum {
  /// 未設定
  unknown,

  /// 学生
  student,

  /// 会社員
  companyEmployee,

  /// 事務
  clericalWork,

  /// 接客
  customerService,

  /// 流通
  distribution,

  /// 食品・飲料
  foodAndBeverage,

  /// 製薬
  pharmaceutical,

  /// 医療
  medicalCare,

  /// 福祉・介護
  welfareNursingCare,

  /// 薬剤師
  pharmacist,

  /// 通信
  communication,

  /// WEB関連
  webRelated,

  /// エンジニア
  engineer,

  /// クリエイター
  creator,

  /// 建築・インテリア
  architectureAndInterior,

  /// 金融
  finance,

  /// 保険
  insurance,

  /// コンサル
  consulting,

  /// マスコミ
  media,

  /// 広告
  advertisement,

  /// 出版
  publishing,

  /// 教育・語学
  educationAndLanguage,

  /// 小売
  retail,

  /// 輸送・交通
  transportation,

  /// エンターテイメント
  entertainment,

  /// 旅行関係
  travelRelated,

  /// 不動産
  realEstate,

  /// 商社
  tradingCompany,

  /// メーカー
  manufacturer,

  /// 研究職
  researcher,

  /// 経営者・役員
  managersAndExecutives,

  /// 法務関係
  legalMatters,

  /// 弁護士
  lawyer,

  /// 公認会計士
  cpa,

  /// 税理士
  taxAccountant,

  /// 自由業
  freeLance,

  /// 公務員
  civilServant,

  /// 消防士
  firefighter,

  /// 警察官
  policeOfficer,

  /// その他
  others,
}

extension OccupatioExtension on OccupatioEenum {
  static final nameValues = {
    OccupatioEenum.unknown: "未設定",
    OccupatioEenum.student: "学生",
    OccupatioEenum.companyEmployee: "会社員",
    OccupatioEenum.clericalWork: "事務",
    OccupatioEenum.customerService: "接客",
    OccupatioEenum.distribution: "流通",
    OccupatioEenum.foodAndBeverage: "食品・飲料",
    OccupatioEenum.pharmaceutical: "製薬",
    OccupatioEenum.medicalCare: "医療",
    OccupatioEenum.welfareNursingCare: "福祉・介護",
    OccupatioEenum.pharmacist: "薬剤師",
    OccupatioEenum.communication: "通信",
    OccupatioEenum.webRelated: "WEB関連",
    OccupatioEenum.engineer: "エンジニア",
    OccupatioEenum.creator: "クリエイター",
    OccupatioEenum.architectureAndInterior: "建築・インテリア",
    OccupatioEenum.finance: "金融",
    OccupatioEenum.insurance: "保険",
    OccupatioEenum.consulting: "コンサル",
    OccupatioEenum.media: "マスコミ",
    OccupatioEenum.advertisement: "広告",
    OccupatioEenum.publishing: "出版",
    OccupatioEenum.educationAndLanguage: "教育・語学",
    OccupatioEenum.retail: "小売",
    OccupatioEenum.transportation: "輸送・交通",
    OccupatioEenum.entertainment: "エンターテイメント",
    OccupatioEenum.travelRelated: "旅行関係",
    OccupatioEenum.realEstate: "不動産",
    OccupatioEenum.tradingCompany: "商社",
    OccupatioEenum.manufacturer: "メーカー",
    OccupatioEenum.researcher: "研究職",
    OccupatioEenum.managersAndExecutives: "経営者・役員",
    OccupatioEenum.legalMatters: "法務関係",
    OccupatioEenum.lawyer: "弁護士",
    OccupatioEenum.cpa: "公認会計士",
    OccupatioEenum.taxAccountant: "税理士",
    OccupatioEenum.freeLance: "自由業",
    OccupatioEenum.civilServant: "公務員",
    OccupatioEenum.firefighter: "消防士",
    OccupatioEenum.policeOfficer: "警察官",
    OccupatioEenum.others: "その他",
  };

  String? get nameValue => nameValues[this];

  static OccupatioEenum from(String rawValue) {
    return OccupatioEenum.values.firstWhere((e) {
      return e.nameValue == rawValue;
    }, orElse: (() {
      return OccupatioEenum.unknown;
    }));
  }
}
