# coding: utf-8

# Copyright (c) 2014 Masahiro Arakane
# 以下の条件を満たす限り、自由な複製・配布・修正を無制限に許可する。
#  - 上記の著作権表示と本許諾書を、ソフトウェアの複製または重要な部分に記載する。
#  - 本ソフトウェアは無保証である。自己責任で使用する。

# 給与支払報告書CSVのバリデータ
require "nkf"

class KyuhouCsvValidator
  INFO    = 'https://github.com/arakanema/kyuhou_csv_validator'
  VERSION = '20140925'

  attr_reader :errors

  def initialize
    @errors = Array.new
  end

  def check_001(lineno, field_data)
    msg = "#{lineno}:#{__method__}:支払調書等の種類315であること."
    unless field_data == "315"
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_002(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:税務署から連絡されている１０桁の整理番号 半角10"
    unless /^([0-9]|[A-z]|\s){2,10}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_003(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:本支店等区分番号 半角5"
    unless /^([0-9]|\-|[A-z]|\s){1,5}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_004(lineno, field_data)
    msg = "#{lineno}:#{__method__}:提出義務者の住所又は所在地 全角60"
    unless /^[^ -~｡-ﾟ]+$/ =~ field_data.encode("utf-8") && field_data.encode("utf-8").split(//).size <= 60
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_005(lineno, field_data)
    msg = "#{lineno}:#{__method__}:提出義務者の氏名又は名称 全角30"
    unless /^[^ -~｡-ﾟ]+$/ =~ field_data.encode("utf-8") && field_data.encode("utf-8").split(//).size <= 30
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_006(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:提出義務者の電話番号 半角15"
    unless /^([0-9]|\-|\s){1,15}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_007(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:税務署から連絡されている１３桁の整理番号 半角13"
    unless /^([0-9]|\-|[A-z]|\s){1,13}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_008(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:提出者の住所又は所在地	ブランク 全角60"
    unless /^[^ -~｡-ﾟ]+$/ =~ field_data.encode("utf-8") && field_data.encode("utf-8").split(//).size <= 60
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_009(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:提出者の氏名又は名称 ブランク 全角30"
    unless /^[^ -~｡-ﾟ]+$/ =~ field_data.encode("utf-8") && field_data.encode("utf-8").split(//).size <= 30
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_010(lineno, field_data)
    msg = "#{lineno}:#{__method__}:訂正表示 数字1 0~3"
    unless /^0|1|2|3$/ =~ field_data && field_data.size == 1
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_011(lineno, field_data)
    msg = "#{lineno}:#{__method__}:年分 数字2"
    unless /^[0-9]{1,2}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_012(lineno, field_data)
    msg = "#{lineno}:#{__method__}:支払を受ける者－住所又は居所 全角60"
    unless /^[^ -~｡-ﾟ]+$/ =~ field_data.encode("utf-8") && field_data.encode("utf-8").split(//).size <= 60
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_013(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:支払を受ける者－国外住居表示 数字1"
    unless /^0|1$/ =~ field_data && field_data.size == 1
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_014(lineno, field_data)
    msg = "#{lineno}:#{__method__}:支払を受ける者－氏名 全角30"
    unless /^[^ -~｡-ﾟ]+$/ =~ field_data.encode("utf-8") && field_data.encode("utf-8").split(//).size <= 30
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_015(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:支払を受ける者－役職名 全角15"
    unless /^[^ -~｡-ﾟ]+$/ =~ field_data.encode("utf-8") && field_data.encode("utf-8").split(//).size <= 15
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_016(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:種別 全角10"
    unless /^[^ -~｡-ﾟ]+$/ =~ field_data.encode("utf-8") && field_data.encode("utf-8").split(//).size <= 10
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_017(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:支払金額 数字10 0以上であること"
    unless /^[0-9]{1,10}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_018(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:未払金額 数字10 0以上であること"
    unless /^[0-9]{1,10}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_019(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:給与所得控除後の給与等の金額 数字10 0以上であること"
    unless /^[0-9]{1,10}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_020(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:所得控除の額の合計額 数字10 0以上であること"
    unless /^[0-9]{1,10}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_021(lineno, field_data)
    msg = "#{lineno}:#{__method__}:源泉徴収税額 数字10 0以上であること"
    return true if field_data == ""
    unless /^[0-9]{1,10}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_022(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:未徴収税額 数字10 0以上であること"
    unless /^[0-9]{1,10}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_023(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:控除対象配偶者の有無等 数字1 1~4"
    unless /^0|1|2|3|4$/ =~ field_data && field_data.size == 1
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_024(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:老人控除対象配偶者 数字1 0~1"
    unless /^0|1$/ =~ field_data && field_data.size == 1
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_025(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:配偶者特別控除の額 10 0以上であること"
    unless /^[0-9]{1,10}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_026(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:控除対象扶養親族の数－特定－主 数字2"
    unless /^[0-9]{1,2}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_027(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:控除対象扶養親族の数－特定－従 数字2"
    unless /^[0-9]{1,2}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_028(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:控除対象扶養親族の数－老人－主 数字2"
    unless /^[0-9]{1,2}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_029(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:控除対象扶養親族の数－老人－上の内訳 数字2"
    unless /^[0-9]{1,2}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_030(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:控除対象扶養親族の数－老人－従 数字2"
    unless /^[0-9]{1,2}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_031(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:控除対象扶養親族の数－その他－主 数字2"
    unless /^[0-9]{1,2}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_032(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:控除対象扶養親族の数－その他－従 数字2"
    unless /^[0-9]{1,2}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_033(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:障害者の数－特別障害者（本人を除く） 数字2"
    unless /^[0-9]{1,2}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_034(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:障害者の数－上の内訳 数字2"
    unless /^[0-9]{1,2}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_035(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:障害者の数－その他 数字2"
    unless /^[0-9]{1,2}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_036(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:社会保険料等の金額 数字10 0以上であること"
    unless /^[0-9]{1,10}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_037(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:社会保険料等の金額の内書 数字10 0以上であること"
    unless /^[0-9]{1,10}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_038(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:生命保険料の控除額 数字10 0以上であること"
    unless /^[0-9]{1,10}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_039(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:地震保険料の控除額 数字10 0以上であること"
    unless /^[0-9]{1,10}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_040(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:住宅借入金等特別控除の額 数字10 0以上であること"
    unless /^[0-9]{1,10}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_041(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:旧個人年金保険料の金額 数字10 0以上であること"
    unless /^[0-9]{1,10}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_042(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:配偶者の合計所得 数字10 0以上であること"
    unless /^[0-9]{1,10}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_043(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:旧長期損害保険料の金額 数字10 0以上であること"
    unless /^[0-9]{1,10}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_044(lineno, field_data)
    msg = "#{lineno}:#{__method__}:受給者の生年月日－元号 数字1 1~4"
    unless /^1|2|3|4$/ =~ field_data && field_data.size == 1
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_045(lineno, field_data)
    msg = "#{lineno}:#{__method__}:受給者の生年月日－年 数字2 01~99"
    unless /^[0-9][0-9]$/ =~ field_data && (1..99).include?(field_data.to_i)
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_046(lineno, field_data)
    msg = "#{lineno}:#{__method__}:受給者の生年月日－月 数字2 01~12"
    unless /^[0-9][0-9]$/ =~ field_data && (1..12).include?(field_data.to_i)
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_047(lineno, field_data)
    msg = "#{lineno}:#{__method__}:受給者の生年月日－日 数字2 01~31"
    unless /^[0-9][0-9]$/ =~ field_data && (1..31).include?(field_data.to_i)
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_048(lineno, field_data)
    msg = "#{lineno}:#{__method__}:夫あり ブランク"
    unless ['', ' ', '0'].member?(field_data)
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_049(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:未成年者 数字1 0~1"
    unless /^0|1$/ =~ field_data && field_data.size == 1
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_050(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:乙欄適用 数字1 0~1"
    unless /^0|1$/ =~ field_data && field_data.size == 1
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_051(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:本人が－特別障害者 数字1 0~1"
    unless /^0|1$/ =~ field_data && field_data.size == 1
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_052(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:本人が－その他の障害者 数字1 0~1"
    unless /^0|1$/ =~ field_data && field_data.size == 1
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_053(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:老年者 数字1 0~1"
    unless /^0|1$/ =~ field_data && field_data.size == 1
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_054(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:寡婦 数字1 0~2"
    unless /^0|1|2$/ =~ field_data && field_data.size == 1
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_055(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:寡夫 数字1 0~1"
    unless /^0|1$/ =~ field_data && field_data.size == 1
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_056(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:勤労学生 数字1 0~1"
    unless /^0|1$/ =~ field_data && field_data.size == 1
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_057(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:死亡退職 数字1 0~1"
    unless /^0|1$/ =~ field_data && field_data.size == 1
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_058(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:災害者 数字1 0~1"
    unless /^0|1$/ =~ field_data && field_data.size == 1
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_059(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:外国人 数字1 0~1"
    unless /^0|1$/ =~ field_data && field_data.size == 1
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_060(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:中途就・退職－中途就職・退職の区分 数字1 0~2"
    unless /^0|1|2$/ =~ field_data && field_data.size == 1
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_061(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:中途就・退職－年 数字2 01~99"
    unless /^[0-9][0-9]$/ =~ field_data && (1..99).include?(field_data.to_i)
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_062(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:中途就・退職－月 数字2 01~12"
    unless /^[0-9][0-9]$/ =~ field_data && (1..12).include?(field_data.to_i)
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_063(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:中途就・退職－日 数字2 01~31"
    unless /^[0-9][0-9]$/ =~ field_data && (1..31).include?(field_data.to_i)
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_064(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:住所又は所在地 全角60"
    unless /^[^ -~｡-ﾟ]{1,60}$/ =~ field_data.encode("utf-8") && field_data.encode("utf-8").split(//).size <= 60
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_065(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:国外住所表示 数字1 0~1"
    unless /^0|1$/ =~ field_data && field_data.size == 1
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_066(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:氏名又は名称 全角30"
    unless /^[^ -~｡-ﾟ]{1,30}$/ =~ field_data.encode("utf-8") && field_data.encode("utf-8").split(//).size <= 30
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_067(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:給与等の金額 数字10 0以上であること"
    unless /^[0-9]{1,10}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_068(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:徴収した額 数字10 0以上であること"
    unless /^[0-9]{1,10}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_069(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:控除した社会保険料の金額 数字10 0以上であること"
    unless /^[0-9]{1,10}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_070(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:災害者に係る徴収猶予税額 数字10 0以上であること"
    unless /^[0-9]{1,10}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_071(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:他の支払者のもとを退職した年月日－年 数字2 01~99"
    unless /^[0-9][0-9]$/ =~ field_data && (1..99).include?(field_data.to_i)
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_072(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:他の支払者のもとを退職した年月日－月 数字2 01~12"
    unless /^[0-9][0-9]$/ =~ field_data && (1..12).include?(field_data.to_i)
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_073(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:他の支払者のもとを退職した年月日－日 数字2 01~31"
    unless /^[0-9][0-9]$/ =~ field_data && (1..31).include?(field_data.to_i)
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_074(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:住宅借入金等特別控除等適用家屋居住年月日(1回目)－年 数字2 01~99"
    unless /^[0-9][0-9]$/ =~ field_data && (1..99).include?(field_data.to_i)
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_075(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:住宅借入金等特別控除等適用家屋居住年月日(1回目)－月 数字2 01~12"
    unless /^[0-9][0-9]$/ =~ field_data && (1..12).include?(field_data.to_i)
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_076(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:住宅借入金等特別控除等適用家屋居住年月日(1回目)－日 数字2 01~31"
    unless /^[0-9][0-9]$/ =~ field_data && (1..31).include?(field_data.to_i)
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_077(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:住宅借入金等特別控除適用数 数字1"
    unless /^[0-9]$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_078(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:住宅借入金等特別控除可能額 数字10 0以上であること"
    unless /^[0-9]{1,10}$/ =~ field_data && field_data.to_i >= 0
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_079(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:住宅借入金等特別控除区分(1回目) 数字2 01~04"
    unless /^[0-9][0-9]$/ =~ field_data && (1..4).include?(field_data.to_i)
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_080(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:住宅借入金等の額(1回目) 数字8 0以上であること"
    unless /^[0-9]{1,8}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_081(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:住宅借入金等特別控除等適用家屋居住年月日(2回目)－年 数字2 01~99"
    unless /^[0-9][0-9]$/ =~ field_data && (1..99).include?(field_data.to_i)
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_082(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:住宅借入金等特別控除等適用家屋居住年月日(2回目)－月 数字2 01~12"
    unless /^[0-9][0-9]$/ =~ field_data && (1..12).include?(field_data.to_i)
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_083(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:住宅借入金等特別控除等適用家屋居住年月日(2回目)－日 数字2 01~31"
    unless /^[0-9][0-9]$/ =~ field_data && (1..31).include?(field_data.to_i)
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_084(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:住宅借入金等特別控除区分(2回目) 数字2 01~04"
    unless /^[0-9][0-9]$/ =~ field_data && (1..4).include?(field_data.to_i)
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_085(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:住宅借入金等の額(2回目) 数字8 0以上であること"
    unless /^[0-9]{1,8}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_086(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:摘要 全角65"
    unless /^[^ -~｡-ﾟ]+$/ =~ field_data.encode("utf-8") && field_data.encode("utf-8").split(//).size <= 65
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_087(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:新生命保険料の金額 数字10 0以上であること"
    unless /^[0-9]{1,10}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_088(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:旧生命保険料の金額 数字10 0以上であること"
    unless /^[0-9]{1,10}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_089(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:介護医療保険料の金額 数字10 0以上であること"
    unless /^[0-9]{1,10}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_090(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:新個人年金保険料の金額 数字10 0以上であること"
    unless /^[0-9]{1,10}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_091(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:16歳未満扶養親族の数 数字2"
    unless /^[0-9]{1,2}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_092(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:普通徴収 数字1 0~1"
    unless /^0|1$/ =~ field_data && field_data.size == 1
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_093(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:青色専従者 数字1 0~1"
    unless /^0|1$/ =~ field_data && field_data.size == 1
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_094(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:条約免除 数字1 0~1"
    unless /^0|1$/ =~ field_data && field_data.size == 1
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_095(lineno, field_data)
    msg = "#{lineno}:#{__method__}:カナ氏名 半角カナ60"
    field_data_utf8 = NKF::nkf('-SwX', field_data)
    unless /^([ア-ン]|\s){1,60}$/ =~ field_data_utf8
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_096(lineno, field_data)
    return true if field_data == ""
    msg = "#{lineno}:#{__method__}:受給者番号 半角25"
    unless /^([0-9]|\-|[A-z]|\s){1,25}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_097(lineno, field_data)
    msg = "#{lineno}:#{__method__}:提出先市町村コード 数字6 5桁~6桁"
    unless /^[0-9]{5,6}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end

  def check_098(lineno, field_data)
    return true if field_data == "" || field_data == "\n"
    msg = "#{lineno}:#{__method__}:指定番号 半角12"
    unless /^([0-9]|\-|[A-z]|\s){0,12}$/ =~ field_data
      @errors.push [msg, field_data]
      return false
    end
    return true
  end
end

def main
  ext_patterns = ["./*.csv", "./*.CSV", "./*.txt", "./*.TXT", "./*.dat", "./*.DAT"]
  csv_files = Dir.glob(ext_patterns).uniq
  csv_files.each do |file|
    puts Time.now.strftime("%Y-%m-%d %H:%M:%S") + " - #{file.to_s[0..24]}"
    input = File.open(file, "r:cp932")
    output = File.open("#{file}.error.log", "wb")
    input.each_line.with_index do |line, lineno|
      validator = KyuhouCsvValidator.new
      begin
        field_data = line.split(",")
      rescue
        puts "\n●ファイルの文字コードが不正です●\nエラー発生ファイル: #{file.to_s}\n\n"
      end
      # TODO: eLTAXは項目数が違う？？？
      unless field_data.size == 98
        output.write "#{lineno + 1}:項目数エラー\n".encode("cp932")
        next
      end
      check_methods = validator.methods.select { |method| /check_\d\d\d/ =~ method }
      check_methods.each.with_index do |check_id, i|
        validator.send(check_id, (lineno + 1), field_data[i])
      end
      validator.errors.each do |error|
        output.write error[0].encode("cp932")
        output.write "\tvalue:"
        output.write error[1] unless error[1] == "\n"
        output.write "\n"
      end
    end
    input.close
    output.close
  end
end

if $0 == __FILE__
  puts "INFO   : #{KyuhouCsvValidator::INFO}"
  puts "VERSION: #{KyuhouCsvValidator::VERSION}"
  puts Time.now.strftime("%Y-%m-%d %H:%M:%S") + " - *Validate start*"
  main()
  puts Time.now.strftime("%Y-%m-%d %H:%M:%S") + " - *Validate finish*"
  puts "\n終了するには何かキーを押してください..."
  dummy = gets
  dummy = nil
end

