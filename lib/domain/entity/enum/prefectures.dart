enum PrefecturesEnum {
  /// 未設定
  unknown,

  /// 北海道
  hokkaido,

  /// 青森県
  aomori,

  /// 岩手県
  iwate,

  /// 宮城県
  miyagi,

  /// 秋田県
  akita,

  /// 山形県
  yamagata,

  /// 福島県
  fukushima,

  /// 茨城県
  ibaraki,

  /// 栃木県
  tochigi,

  /// 群馬県
  gunma,

  /// 埼玉県
  saitama,

  /// 千葉県
  chiba,

  /// 東京都
  tokyo,

  /// 神奈川県
  kanagawa,

  /// 新潟県
  niigata,

  /// 富山県
  toyama,

  /// 石川県
  ishikawa,

  /// 福井県
  fukui,

  /// 山梨県
  yamanashi,

  /// 長野県
  nagano,

  /// 岐阜県
  gifu,

  /// 静岡県
  shizuoka,

  /// 愛知県
  aichi,

  /// 三重県
  mie,

  /// 滋賀県
  shiga,

  /// 京都府
  kyoto,

  /// 大阪府
  osaka,

  /// 兵庫県
  hyogo,

  /// 奈良県
  nara,

  /// 和歌山県
  wakayama,

  /// 鳥取県
  tottori,

  /// 島根県
  shimane,

  /// 岡山県
  okayama,

  /// 広島県
  hiroshima,

  /// 山口県
  yamaguchi,

  /// 徳島県
  tokushima,

  /// 香川県
  kagawa,

  /// 愛媛県
  ehime,

  /// 高知県
  kochi,

  /// 福岡県
  fukuoka,

  /// 佐賀県
  saga,

  /// 長崎県
  nagasaki,

  /// 熊本県
  kumamoto,

  /// 大分県
  oita,

  /// 宮崎県
  miyazaki,

  /// 鹿児島県
  kagoshima,

  /// 沖縄県
  okinawa,
}

extension PrefecturesExtension on PrefecturesEnum {
  static final nameValues = {
    PrefecturesEnum.unknown: "未設定",
    PrefecturesEnum.hokkaido: "北海道",
    PrefecturesEnum.aomori: "青森県",
    PrefecturesEnum.iwate: "岩手県",
    PrefecturesEnum.miyagi: "宮城県",
    PrefecturesEnum.akita: "秋田県",
    PrefecturesEnum.yamagata: "山形県",
    PrefecturesEnum.fukushima: "福島県",
    PrefecturesEnum.ibaraki: "茨城県",
    PrefecturesEnum.tochigi: "栃木県",
    PrefecturesEnum.gunma: "群馬県",
    PrefecturesEnum.saitama: "埼玉県",
    PrefecturesEnum.chiba: "千葉県",
    PrefecturesEnum.tokyo: "東京都",
    PrefecturesEnum.kanagawa: "神奈川県",
    PrefecturesEnum.niigata: "新潟県",
    PrefecturesEnum.toyama: "富山県",
    PrefecturesEnum.ishikawa: "石川県",
    PrefecturesEnum.fukui: "福井県",
    PrefecturesEnum.yamanashi: "山梨県",
    PrefecturesEnum.nagano: "長野県",
    PrefecturesEnum.gifu: "岐阜県",
    PrefecturesEnum.shizuoka: "静岡県",
    PrefecturesEnum.aichi: "愛知県",
    PrefecturesEnum.mie: "三重県",
    PrefecturesEnum.shiga: "滋賀県",
    PrefecturesEnum.kyoto: "京都府",
    PrefecturesEnum.osaka: "大阪府",
    PrefecturesEnum.hyogo: "兵庫県",
    PrefecturesEnum.nara: "奈良県",
    PrefecturesEnum.wakayama: "和歌山県",
    PrefecturesEnum.tottori: "鳥取県",
    PrefecturesEnum.shimane: "島根県",
    PrefecturesEnum.okayama: "岡山県",
    PrefecturesEnum.hiroshima: "広島県",
    PrefecturesEnum.yamaguchi: "山口県",
    PrefecturesEnum.tokushima: "徳島県",
    PrefecturesEnum.kagawa: "香川県",
    PrefecturesEnum.ehime: "愛媛県",
    PrefecturesEnum.kochi: "高知県",
    PrefecturesEnum.fukuoka: "福岡県",
    PrefecturesEnum.saga: "佐賀県",
    PrefecturesEnum.nagasaki: "長崎県",
    PrefecturesEnum.kumamoto: "熊本県",
    PrefecturesEnum.oita: "大分県",
    PrefecturesEnum.miyazaki: "宮崎県",
    PrefecturesEnum.kagoshima: "鹿児島県",
    PrefecturesEnum.okinawa: "沖縄県",
  };

  String? get nameValue => nameValues[this];

  static PrefecturesEnum from(String rawValue) {
    return PrefecturesEnum.values.firstWhere((e) {
      return e.nameValue == rawValue;
    }, orElse: (() {
      return PrefecturesEnum.unknown;
    }));
  }
}
