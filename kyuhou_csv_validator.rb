# coding: utf-8

VERSION = '20141004'

class KyuhouCsvValidator

  attr_reader :prepare_err, :eltax_data

  OK      = true
  NG      = false
  LOG_SEP = "\t"
  CASE    = {
    check_enc: {
      :msg      => "●ファイルの文字コードが不正です●",
    },
    check_cnt: {
      :msg      => "●項目数が不正です●",
    },
    check_001: {
      :msg      => "支払調書等の種類315であること 必須",
      :must     => true,
      :pattern  => /^315$/,
      :max_size => 3,
      :range    => nil,
    },
    check_002: {
      :msg      => "税務署から連絡されている１０桁の整理番号 半角10",
      :must     => false,
      :pattern  => /^([0-9]|[A-z]|\s)*$/,
      :max_size => 10,
      :range    => nil,
    },
    check_003: {
      :msg      => "本支店等区分番号 半角5",
      :must     => false,
      :pattern  => /^[[:ascii:]]*$/,
      :max_size => 5,
      :range    => nil,
    },
    check_004: {
      :msg      => "提出義務者の住所又は所在地 必須 全角60",
      :must     => true,
      :pattern  => /^[^ -~｡-ﾟ]+$/,
      :max_size => 60,
      :range    => nil,
    },
    check_005: {
      :msg      => "提出義務者の氏名又は名称 必須 全角30",
      :must     => true,
      :pattern  => /^[^ -~｡-ﾟ]+$/,
      :max_size => 30,
      :range    => nil,
    },
    check_006: {
      :msg      => "提出義務者の電話番号 半角15",
      :must     => false,
      :pattern  => /^[[:ascii:]]*$/,
      :max_size => 15,
      :range    => nil,
    },
    check_007: {
      :msg      => "税務署から連絡されている１３桁の整理番号 半角13",
      :must     => false,
      :pattern  => /^[[:ascii:]]*$/,
      :max_size => 13,
      :range    => nil,
    },
    check_008: {
      :msg      => "提出者の住所又は所在地 ブランク 全角60",
      :must     => false,
      :pattern  => /^[^ -~｡-ﾟ]*$/,
      :max_size => 60,
      :range    => nil,
    },
    check_009: {
      :msg      => "提出者の氏名又は名称 ブランク 全角30",
      :must     => false,
      :pattern  => /^[^ -~｡-ﾟ]*$/,
      :max_size => 30,
      :range    => nil,
    },
    check_010: {
      :msg      => "訂正表示 必須 数字1 0~3",
      :must     => true,
      :pattern  => /^0|1|2|3$/,
      :max_size => 1,
      :range    => nil,
    },
    check_011: {
      :msg      => "年分 必須 数字2",
      :must     => true,
      :pattern  => /^[0-9]+$/,
      :max_size => 2,
      :range    => nil,
    },
    check_012: {
      :msg      => "支払を受ける者－住所又は居所 必須 全角60",
      :must     => true,
      :pattern  => /^[^ -~｡-ﾟ]+$/,
      :max_size => 60,
      :range    => nil,
    },
    check_013: {
      :msg      => "支払を受ける者－国外住居表示 数字1 0~1",
      :must     => false,
      :pattern  => /^(0|1)*$/,
      :max_size => 1,
      :range    => nil,
    },
    check_014: {
      :msg      => "支払を受ける者－氏名 必須 全角30",
      :must     => true,
      :pattern  => /^[^ -~｡-ﾟ]+$/,
      :max_size => 30,
      :range    => nil,
    },
    check_015: {
      :msg      => "支払を受ける者－役職名 全角15",
      :must     => false,
      :pattern  => /^[^ -~｡-ﾟ]*$/,
      :max_size => 15,
      :range    => nil,
    },
    check_016: {
      :msg      => "種別 全角10",
      :must     => false,
      :pattern  => /^[^ -~｡-ﾟ]*$/,
      :max_size => 10,
      :range    => nil,
    },
    check_017: {
      :msg      => "支払金額 数字10 0以上であること",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 10,
      :range    => nil,
    },
    check_018: {
      :msg      => "未払金額 数字10 0以上であること",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 10,
      :range    => nil,
    },
    check_019: {
      :msg      => "給与所得控除後の給与等の金額 数字10 0以上であること",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 10,
      :range    => nil,
    },
    check_020: {
      :msg      => "所得控除の額の合計額 数字10 0以上であること",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 10,
      :range    => nil,
    },
    check_021: {
      :msg      => "源泉徴収税額 数字10 0以上であること",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 10,
      :range    => nil,
    },
    check_022: {
      :msg      => "未徴収税額 数字10 0以上であること",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 10,
      :range    => nil,
    },
    check_023: {
      :msg      => "控除対象配偶者の有無等 数字1 1~4",
      :must     => false,
      :pattern  => /^(0|1|2|3|4)*$/,
      :max_size => 1,
      :range    => nil,
    },
    check_024: {
      :msg      => "老人控除対象配偶者 数字1 0~1",
      :must     => false,
      :pattern  => /^(0|1)*$/,
      :max_size => 1,
      :range    => nil,
    },
    check_025: {
      :msg      => "配偶者特別控除の額 数字10 0以上であること",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 10,
      :range    => nil,
    },
    check_026: {
      :msg      => "控除対象扶養親族の数－特定－主 数字2",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 2,
      :range    => nil,
    },
    check_027: {
      :msg      => "控除対象扶養親族の数－特定－従 数字2",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 2,
      :range    => nil,
    },
    check_028: {
      :msg      => "控除対象扶養親族の数－老人－主 数字2",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 2,
      :range    => nil,
    },
    check_029: {
      :msg      => "控除対象扶養親族の数－老人－上の内訳 数字2",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 2,
      :range    => nil,
    },
    check_030: {
      :msg      => "控除対象扶養親族の数－老人－従 数字2",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 2,
      :range    => nil,
    },
    check_031: {
      :msg      => "控除対象扶養親族の数－その他－主 数字2",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 2,
      :range    => nil,
    },
    check_032: {
      :msg      => "控除対象扶養親族の数－その他－従 数字2",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 2,
      :range    => nil,
    },
    check_033: {
      :msg      => "障害者の数－特別障害者（本人を除く） 数字2",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 2,
      :range    => nil,
    },
    check_034: {
      :msg      => "障害者の数－上の内訳 数字2",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 2,
      :range    => nil,
    },
    check_035: {
      :msg      => "障害者の数－その他 数字2",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 2,
      :range    => nil,
    },
    check_036: {
      :msg      => "社会保険料等の金額 数字10 0以上であること",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 10,
      :range    => nil,
    },
    check_037: {
      :msg      => "社会保険料等の金額の内書 数字10 0以上であること",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 10,
      :range    => nil,
    },
    check_038: {
      :msg      => "生命保険料の控除額 数字10 0以上であること",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 10,
      :range    => nil,
    },
    check_039: {
      :msg      => "地震保険料の控除額 数字10 0以上であること",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 10,
      :range    => nil,
    },
    check_040: {
      :msg      => "住宅借入金等特別控除の額 数字10 0以上であること",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 10,
      :range    => nil,
    },
    check_041: {
      :msg      => "旧個人年金保険料の金額 数字10 0以上であること",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 10,
      :range    => nil,
    },
    check_042: {
      :msg      => "配偶者の合計所得 数字10 0以上であること",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 10,
      :range    => nil,
    },
    check_043: {
      :msg      => "旧長期損害保険料の金額 数字10 0以上であること",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 10,
      :range    => nil,
    },
    check_044: {
      :msg      => "受給者の生年月日－元号 必須 数字1 1~4",
      :must     => true,
      :pattern  => /^1|2|3|4$/,
      :max_size => 1,
      :range    => nil,
    },
    check_045: {
      :msg      => "受給者の生年月日－年 必須 数字2 01~99",
      :must     => true,
      :pattern  => /^[0-9][0-9]$/,
      :max_size => 2,
      :range    => 1..99,
    },
    check_046: {
      :msg      => "受給者の生年月日－月 必須 数字2 01~12",
      :must     => true,
      :pattern  => /^[0-9][0-9]$/,
      :max_size => 2,
      :range    => 1..12,
    },
    check_047: {
      :msg      => "受給者の生年月日－日 必須 数字2 01~31",
      :must     => true,
      :pattern  => /^[0-9][0-9]$/,
      :max_size => 2,
      :range    => 1..31,
    },
    check_048: {
      :msg      => "夫あり ブランク 半角1",
      :must     => false,
      :pattern  => /^[[:ascii:]]*$/,
      :max_size => 1,
      :range    => nil,
    },
    check_049: {
      :msg      => "未成年者 数字1 0~1",
      :must     => false,
      :pattern  => /^(0|1)*$/,
      :max_size => 1,
      :range    => nil,
    },
    check_050: {
      :msg      => "乙欄適用 数字1 0~1",
      :must     => false,
      :pattern  => /^(0|1)*$/,
      :max_size => 1,
      :range    => nil,
    },
    check_051: {
      :msg      => "本人が－特別障害者 数字1 0~1",
      :must     => false,
      :pattern  => /^(0|1)*$/,
      :max_size => 1,
      :range    => nil,
    },
    check_052: {
      :msg      => "本人が－その他の障害者 数字1 0~1",
      :must     => false,
      :pattern  => /^(0|1)*$/,
      :max_size => 1,
      :range    => nil,
    },
    check_053: {
      :msg      => "老年者 数字1 0~1",
      :must     => false,
      :pattern  => /^(0|1)*$/,
      :max_size => 1,
      :range    => nil,
    },
    check_054: {
      :msg      => "寡婦 数字1 0~2",
      :must     => false,
      :pattern  => /^(0|1|2)*$/,
      :max_size => 1,
      :range    => nil,
    },
    check_055: {
      :msg      => "寡夫 数字1 0~1",
      :must     => false,
      :pattern  => /^(0|1)*$/,
      :max_size => 1,
      :range    => nil,
    },
    check_056: {
      :msg      => "勤労学生 数字1 0~1",
      :must     => false,
      :pattern  => /^(0|1)*$/,
      :max_size => 1,
      :range    => nil,
    },
    check_057: {
      :msg      => "死亡退職 数字1 0~1",
      :must     => false,
      :pattern  => /^(0|1)*$/,
      :max_size => 1,
      :range    => nil,
    },
    check_058: {
      :msg      => "災害者 数字1 0~1",
      :must     => false,
      :pattern  => /^(0|1)*$/,
      :max_size => 1,
      :range    => nil,
    },
    check_059: {
      :msg      => "外国人 数字1 0~1",
      :must     => false,
      :pattern  => /^(0|1)*$/,
      :max_size => 1,
      :range    => nil,
    },
    check_060: {
      :msg      => "中途就・退職－中途就職・退職の区分 数字1 0~2",
      :must     => false,
      :pattern  => /^(0|1|2)*$/,
      :max_size => 1,
      :range    => nil,
    },
    check_061: {
      :msg      => "中途就・退職－年 数字2 01~99",
      :must     => false,
      :pattern  => /^([0-9][0-9])*$/,
      :max_size => 2,
      :range    => 1..99,
    },
    check_062: {
      :msg      => "中途就・退職－月 数字2 01~12",
      :must     => false,
      :pattern  => /^([0-9][0-9])*$/,
      :max_size => 2,
      :range    => 1..12,
    },
    check_063: {
      :msg      => "中途就・退職－日 数字2 01~31",
      :must     => false,
      :pattern  => /^([0-9][0-9])*$/,
      :max_size => 2,
      :range    => 1..31,
    },
    check_064: {
      :msg      => "住所又は所在地 全角60",
      :must     => false,
      :pattern  => /^[^ -~｡-ﾟ]*$/,
      :max_size => 60,
      :range    => nil,
    },
    check_065: {
      :msg      => "国外住所表示 数字1 0~1",
      :must     => false,
      :pattern  => /^(0|1)*$/,
      :max_size => 1,
      :range    => nil,
    },
    check_066: {
      :msg      => "氏名又は名称 全角30",
      :must     => false,
      :pattern  => /^[^ -~｡-ﾟ]*$/,
      :max_size => 30,
      :range    => nil,
    },
    check_067: {
      :msg      => "給与等の金額 数字10 0以上であること",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 10,
      :range    => nil,
    },
    check_068: {
      :msg      => "徴収した額 数字10 0以上であること",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 10,
      :range    => nil,
    },
    check_069: {
      :msg      => "控除した社会保険料の金額 数字10 0以上であること",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 10,
      :range    => nil,
    },
    check_070: {
      :msg      => "災害者に係る徴収猶予税額 数字10 0以上であること",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 10,
      :range    => nil,
    },
    check_071: {
      :msg      => "他の支払者のもとを退職した年月日－年 数字2 01~99",
      :must     => false,
      :pattern  => /^([0-9][0-9])*$/,
      :max_size => 2,
      :range    => 1..99,
    },
    check_072: {
      :msg      => "他の支払者のもとを退職した年月日－月 数字2 01~12",
      :must     => false,
      :pattern  => /^([0-9][0-9])*$/,
      :max_size => 2,
      :range    => 1..12,
    },
    check_073: {
      :msg      => "他の支払者のもとを退職した年月日－日 数字2 01~31",
      :must     => false,
      :pattern  => /^([0-9][0-9])*$/,
      :max_size => 2,
      :range    => 1..31,
    },
    check_074: {
      :msg      => "住宅借入金等特別控除等適用家屋居住年月日(1回目)－年 数字2 01~99",
      :must     => false,
      :pattern  => /^([0-9][0-9])*$/,
      :max_size => 2,
      :range    => 1..99,
    },
    check_075: {
      :msg      => "住宅借入金等特別控除等適用家屋居住年月日(1回目)－月 数字2 01~12",
      :must     => false,
      :pattern  => /^([0-9][0-9])*$/,
      :max_size => 2,
      :range    => 1..12,
    },
    check_076: {
      :msg      => "住宅借入金等特別控除等適用家屋居住年月日(1回目)－日 数字2 01~31",
      :must     => false,
      :pattern  => /^([0-9][0-9])*$/,
      :max_size => 2,
      :range    => 1..31,
    },
    check_077: {
      :msg      => "住宅借入金等特別控除適用数 数字1",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 1,
      :range    => nil,
    },
    check_078: {
      :msg      => "住宅借入金等特別控除可能額 数字10 0以上であること",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 10,
      :range    => nil,
    },
    check_079: {
      :msg      => "住宅借入金等特別控除区分(1回目) 数字2 01~04",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 2,
      :range    => 1..4,
    },
    check_080: {
      :msg      => "住宅借入金等の額(1回目) 数字8 0以上であること",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 8,
      :range    => nil,
    },
    check_081: {
      :msg      => "住宅借入金等特別控除等適用家屋居住年月日(2回目)－年 数字2 01~99",
      :must     => false,
      :pattern  => /^([0-9][0-9])*$/,
      :max_size => 2,
      :range    => 1..99,
    },
    check_082: {
      :msg      => "住宅借入金等特別控除等適用家屋居住年月日(2回目)－月 数字2 01~12",
      :must     => false,
      :pattern  => /^([0-9][0-9])*$/,
      :max_size => 2,
      :range    => 1..12,
    },
    check_083: {
      :msg      => "住宅借入金等特別控除等適用家屋居住年月日(2回目)－日 数字2 01~31",
      :must     => false,
      :pattern  => /^([0-9][0-9])*$/,
      :max_size => 2,
      :range    => 1..31,
    },
    check_084: {
      :msg      => "住宅借入金等特別控除区分(2回目) 数字2 01~04",
      :must     => false,
      :pattern  => /^([0-9][0-9])*$/,
      :max_size => 2,
      :range    => 1..4,
    },
    check_085: {
      :msg      => "住宅借入金等の額(2回目) 数字8 0以上であること",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 8,
      :range    => nil,
    },
    check_086: {
      :msg      => "摘要 全角65",
      :must     => false,
      :pattern  => /^[^ -~｡-ﾟ]*$/,
      :max_size => 65,
      :range    => nil,
    },
    check_087: {
      :msg      => "新生命保険料の金額 数字10 0以上であること",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 10,
      :range    => nil,
    },
    check_088: {
      :msg      => "旧生命保険料の金額 数字10 0以上であること",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 10,
      :range    => nil,
    },
    check_089: {
      :msg      => "介護医療保険料の金額 数字10 0以上であること",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 10,
      :range    => nil,
    },
    check_090: {
      :msg      => "新個人年金保険料の金額 数字10 0以上であること",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 10,
      :range    => nil,
    },
    check_091: {
      :msg      => "16歳未満扶養親族の数 数字2",
      :must     => false,
      :pattern  => /^[0-9]*$/,
      :max_size => 2,
      :range    => nil,
    },
    check_092: {
      :msg      => "普通徴収 数字1 0~1",
      :must     => false,
      :pattern  => /^(0|1)*$/,
      :max_size => 1,
      :range    => nil,
    },
    check_093: {
      :msg      => "青色専従者 数字1 0~1",
      :must     => false,
      :pattern  => /^(0|1)*$/,
      :max_size => 1,
      :range    => nil,
    },
    check_094: {
      :msg      => "条約免除 数字1 0~1",
      :must     => false,
      :pattern  => /^(0|1)*$/,
      :max_size => 1,
      :range    => nil,
    },
    check_095: {
      :msg      => "カナ氏名 必須 半角カナ60",
      :must     => true,
      :pattern  => /^([\xA1-\xDF]|\s)+$/s,
      :max_size => 60,
      :range    => nil,
      :hankaku_kana => true,
    },
    check_096: {
      :msg      => "受給者番号 半角25",
      :must     => false,
      :pattern  => /^[[:ascii:]]*$/,
      :max_size => 25,
      :range    => nil,
    },
    check_097: {
      :msg      => "提出先市町村コード 必須 数字6 5桁~6桁",
      :must     => true,
      :pattern  => /^[0-9]{5,}$/,
      :max_size => 6,
      :range    => nil,
    },
    check_098: {
      :msg      => "指定番号 半角12",
      :must     => false,
      :pattern  => /^[[:ascii:]]*$/,
      :max_size => 12,
      :range    => nil,
    },
  }

  def initialize(log_fd)
    @logging_to  = log_fd
    @prepare_err = nil
    @eltax_data  = false
  end

  def prepare_validate?(line)
    begin
      size = line.split(/@/).size
      @eltax_data = true if size == 2
    rescue
      @prepare_err = :check_enc
      return false
    end
    data = ""
    if @eltax_data
      data = line.split(/@/)[1]
    else
      data = line
    end
    unless data.split(/,/).size == 98
      @prepare_err = :check_cnt
      return false
    end
    return true
  end

  def validate(check_id, data, lineno)
    test_case = data.chomp
    validate_result = OK
    error_msg = []
    # must
    if test_case.empty? && CASE[check_id][:must]
      validate_result = NG 
      error_msg.push "必須"
    end
    # pattern
    if CASE[check_id][:hankaku_kana]
      unless CASE[check_id][:pattern] =~ test_case
        validate_result = NG
        error_msg.push "パターン"
      end
    else
      unless CASE[check_id][:pattern] =~ test_case.encode('utf-8')
        validate_result = NG
        error_msg.push "パターン"
      end
    end
    # size
    if !test_case.empty? && CASE[check_id][:max_size] < test_case.encode('utf-8').split(//).size
      validate_result = NG
      error_msg.push "サイズ"
    end
    # range
    if !test_case.empty? && CASE[check_id][:range] && !CASE[check_id][:hankaku_kana]
      begin
        unless CASE[check_id][:range].include?(test_case.to_i)
          validate_result = NG
          error_msg.push "範囲"
        end
      rescue
        validate_result = NG
        error_msg.push "範囲"
      end
    end
    # logging
    unless validate_result == OK
      logging(check_id, test_case, lineno, error_msg.join('&')) if @logging_to
      return NG
    end
    return OK
  end

  def logging(check_id, data, lineno, error_msg)
    log_output  = "#{sprintf('%05d', lineno)}#{LOG_SEP}"
    log_output += "#{check_id.to_s}#{LOG_SEP}"
    log_output += "#{CASE[check_id][:msg]}#{LOG_SEP}"
    log_output += "#{error_msg}#{LOG_SEP}"
    @logging_to.write log_output.encode('cp932')
    @logging_to.puts ">#{data}<".encode('cp932')
  end
end

def main
  ext_patterns = ["./*.csv", "./*.txt", "./*.dat"]
  csv_files = Dir.glob(ext_patterns)
  csv_files.each do |file|
    puts Time.now.strftime("%Y-%m-%d %H:%M:%S ") + "#{file.to_s}"
    input = File.open(file, "r:cp932")
    output = File.open("#{file}.error.log", "w:cp932")
    input.each_line.with_index do |line, lineno|
      validator = KyuhouCsvValidator.new(output)
      unless validator.prepare_validate?(line)
        validator.logging(validator.prepare_err, '', lineno + 1, '検証不可能')
        next
      end
      if validator.eltax_data
        target_data = line.split(/@/)[1]
      else
        target_data = line
      end
      target_data.split(/,/).each.with_index do |data, index|
        check_id = "check_#{sprintf('%03d', index + 1)}".to_sym
        validator.validate(check_id, data, lineno + 1)
      end
    end
    input.close; output.close
  end
end

def show_info(version)
  info = <<-INFO

  The MIT License (MIT)

  Copyright (c) 2014 Masahiro Arakane

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.

  - kyuhou_csv_validator.rb
    - version : #{version}
    - https://github.com/arakanema/kyuhou_csv_validator

  INFO
  puts info
end

if $0 == __FILE__
  show_info(VERSION)
  puts "処理を開始します、何かキーを押してください"
  dummy = gets
  main()
  puts "終了するには何かキーを押してください"
  dummy = gets
end

