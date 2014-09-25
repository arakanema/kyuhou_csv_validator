# coding: utf-8

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
      check_017: '-12345',
      check_018: '12-345',
      check_019: ' 12345',
      check_020: '12345'*3,
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
      check_085: '12345',
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

  def mock(method_name)
    check_id = method_name.to_s.split('_')[1..-1].join('_')
    fixture = @fixtures[check_id.to_sym]
    assert_equal false, @kd.send(check_id, @lineno, fixture),
      "fixture => #{fixture}"
  end

  def test_check_001; mock __method__; end
  def test_check_002; mock __method__; end
  def test_check_003; mock __method__; end
  def test_check_004; mock __method__; end
  def test_check_005; mock __method__; end
  def test_check_006; mock __method__; end
  def test_check_007; mock __method__; end
  def test_check_008; mock __method__; end
  def test_check_009; mock __method__; end
  def test_check_011; mock __method__; end
  def test_check_012; mock __method__; end
  def test_check_013; mock __method__; end
  def test_check_014; mock __method__; end
  def test_check_015; mock __method__; end
  def test_check_016; mock __method__; end
  def test_check_017; mock __method__; end
  def test_check_018; mock __method__; end
  def test_check_019; mock __method__; end
  def test_check_020; mock __method__; end
  def test_check_021; mock __method__; end
  def test_check_022; mock __method__; end
  def test_check_023; mock __method__; end
  def test_check_024; mock __method__; end
  def test_check_025; mock __method__; end
  def test_check_026; mock __method__; end
  def test_check_027; mock __method__; end
  def test_check_028; mock __method__; end
  def test_check_029; mock __method__; end
  def test_check_030; mock __method__; end
  def test_check_031; mock __method__; end
  def test_check_032; mock __method__; end
  def test_check_033; mock __method__; end
  def test_check_034; mock __method__; end
  def test_check_035; mock __method__; end
  def test_check_036; mock __method__; end
  def test_check_037; mock __method__; end
  def test_check_038; mock __method__; end
  def test_check_039; mock __method__; end
  def test_check_040; mock __method__; end
  def test_check_041; mock __method__; end
  def test_check_042; mock __method__; end
  def test_check_043; mock __method__; end
  def test_check_044; mock __method__; end
  def test_check_045; mock __method__; end
  def test_check_046; mock __method__; end
  def test_check_047; mock __method__; end
  def test_check_048; mock __method__; end
  def test_check_049; mock __method__; end
  def test_check_050; mock __method__; end
  def test_check_051; mock __method__; end
  def test_check_052; mock __method__; end
  def test_check_053; mock __method__; end
  def test_check_054; mock __method__; end
  def test_check_055; mock __method__; end
  def test_check_056; mock __method__; end
  def test_check_057; mock __method__; end
  def test_check_058; mock __method__; end
  def test_check_059; mock __method__; end
  def test_check_060; mock __method__; end
  def test_check_061; mock __method__; end
  def test_check_062; mock __method__; end
  def test_check_063; mock __method__; end
  def test_check_064; mock __method__; end
  def test_check_065; mock __method__; end
  def test_check_066; mock __method__; end
  def test_check_067; mock __method__; end
  def test_check_068; mock __method__; end
  def test_check_069; mock __method__; end
  def test_check_070; mock __method__; end
  def test_check_071; mock __method__; end
  def test_check_072; mock __method__; end
  def test_check_073; mock __method__; end
  def test_check_074; mock __method__; end
  def test_check_075; mock __method__; end
  def test_check_076; mock __method__; end
  def test_check_077; mock __method__; end
  def test_check_078; mock __method__; end
  def test_check_079; mock __method__; end
  def test_check_080; mock __method__; end
  def test_check_081; mock __method__; end
  def test_check_082; mock __method__; end
  def test_check_083; mock __method__; end
  def test_check_084; mock __method__; end
  def test_check_085; mock __method__; end
  def test_check_086; mock __method__; end
  def test_check_087; mock __method__; end
  def test_check_088; mock __method__; end
  def test_check_089; mock __method__; end
  def test_check_090; mock __method__; end
  def test_check_091; mock __method__; end
  def test_check_092; mock __method__; end
  def test_check_093; mock __method__; end
  def test_check_094; mock __method__; end
  def test_check_095; mock __method__; end
  def test_check_096; mock __method__; end
  def test_check_097; mock __method__; end
  def test_check_098; mock __method__; end
end
