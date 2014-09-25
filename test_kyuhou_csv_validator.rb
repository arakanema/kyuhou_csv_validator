# coding: utf-8

# Copyright (c) 2014 Masahiro Arakane
# 以下の条件を満たす限り、自由な複製・配布・修正を無制限に許可する。
#  - 上記の著作権表示と本許諾書を、ソフトウェアの複製または重要な部分に記載する。
#  - 本ソフトウェアは無保証である。自己責任で使用する。

$:.unshift(File.expand_path(File.dirname(__FILE__)))
require "kyuhou_csv_validator"
require "test/unit"

class KyuhouCsvValidatorTest < Test::Unit::TestCase
  def setup
    @kd = KyuhouCsvValidator.new
    @lineno = 0
    @fixtures = {
      check_001: '318',
      check_002: '12345678901',
      check_003: '12345あ',
      check_004: '東京 都千代田区永田町二丁目ああああああああああああああああ',
      check_005: 'ｆｊｄａｏｉｊｆｏａｊｆ  ｏａｊｆａｊｏｆａｆ',
      check_006: '0120-123-456A',
      check_007: '1234567890a39999',
      check_008: 'fa  ',
      check_009: 'ba   aaa',
      check_010: '4',
      check_011: '２４',
      check_012: 'あいう えお-かきくけこ',
      check_013: '8',
      check_014: '支払い-太郎',
      check_015: '窓際係長 ',
      check_016: 'syubetu',
      check_017: '12-345',
      check_018: '12-345',
      check_019: '-12345',
      check_020: '12345 ',
      check_021: '12345あ',
      check_022: '1234 5',
      check_023: '9',
      check_024: '8',
      check_025: '-12345',
      check_026: '12 ',
      check_027: '123',
      check_028: '-9',
      check_029: '2300',
      check_030: '588',
      check_031: '577',
      check_032: '45aaaa',
      check_033: '33fafa',
      check_034: '34  fa',
      check_035: '9 ',
      check_036: '-12345',
      check_037: '-12345',
      check_038: '-12345',
      check_039: '-12345',
      check_040: '-12345',
      check_041: '-12345',
      check_042: '-12345',
      check_043: '-12345',
      check_044: '9',
      check_045: '00',
      check_046: '14',
      check_047: '43',
      check_048: '-',
      check_049: '8',
      check_050: '8',
      check_051: '7',
      check_052: '9',
      check_053: '7',
      check_054: ' ',
      check_055: '7',
      check_056: '3',
      check_057: '9',
      check_058: '7',
      check_059: '9',
      check_060: '3',
      check_061: '２３',
      check_062: '00',
      check_063: '34',
      check_064: 'あい-うえお',
      check_065: '3',
      check_066: 'あ-いう えお',
      check_067: '12345678901',
      check_068: '-12345',
      check_069: '12 345',
      check_070: ' 12345',
      check_071: '154',
      check_072: '18',
      check_073: '9',
      check_074: '100',
      check_075: '6',
      check_076: '41',
      check_077: '12',
      check_078: '12345678901',
      check_079: '08',
      check_080: '-12345678',
      check_081: '120',
      check_082: '13',
      check_083: '32',
      check_084: '07',
      check_085: '-12345',
      check_086: 'かき くけこ',
      check_087: '123456789 ',
      check_088: '12345 ',
      check_089: '-12345',
      check_090: ' 12345',
      check_091: ' 1',
      check_092: '2',
      check_093: '3',
      check_094: '5',
      check_095: 'ｱｲｳｴｵ ｶｷあ',
      check_096: 'Ａ12345',
      check_097: '1234567',
      check_098: '123 56-890123',
    }
  end

  def test_check_001
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_002
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_003
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_004
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_005
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_006
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_007
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_008
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_009
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_010
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_011
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_012
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_013
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_014
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_015
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_016
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_017
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_018
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_019
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_020
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_021
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_022
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_023
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_024
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_025
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_026
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_027
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_028
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_029
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_030
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_031
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_032
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_033
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_034
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_035
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_036
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_037
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_038
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_039
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_040
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_041
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_042
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_043
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_044
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_045
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_046
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_047
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_048
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_049
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_050
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_051
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_052
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_053
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_054
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_055
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_056
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_057
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_058
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_059
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_060
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_061
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_062
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_063
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_064
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_065
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_067
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_068
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_069
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_070
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_071
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_072
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_073
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_074
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_075
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_076
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_077
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_078
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_079
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_080
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_081
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_082
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_083
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_084
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_085
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_086
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_087
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_088
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_089
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_090
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_091
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_092
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_093
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_094
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_095
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_096
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_097
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end

  def test_check_098
    method_name = __method__.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[method_name.to_sym]
    assert_equal false, @kd.send(method_name, @lineno, fixture)
  end
end

