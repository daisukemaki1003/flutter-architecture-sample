import '../enum/holiday.dart';

class Holiday {
  bool mon;
  bool tue;
  bool wed;
  bool thu;
  bool fri;
  bool sat;
  bool sun;

  Holiday({
    this.mon = false,
    this.tue = false,
    this.wed = false,
    this.thu = false,
    this.fri = false,
    this.sat = false,
    this.sun = false,
  });

  static fromBinary(int holidayNum) {
    final holiday = Holiday();
    String holidayBinary = holidayNum.toRadixString(2);
    List<String> holidayBinaryList = holidayBinary.padLeft(7, '0').split('');

    holiday.mon = int.parse(holidayBinaryList[0]) != 0;
    holiday.tue = int.parse(holidayBinaryList[1]) != 0;
    holiday.wed = int.parse(holidayBinaryList[2]) != 0;
    holiday.thu = int.parse(holidayBinaryList[3]) != 0;
    holiday.fri = int.parse(holidayBinaryList[4]) != 0;
    holiday.sat = int.parse(holidayBinaryList[5]) != 0;
    holiday.sun = int.parse(holidayBinaryList[6]) != 0;

    return holiday;
  }

  int toBinary() {
    String buf = "";
    mon ? buf += '1' : buf += '0';
    tue ? buf += '1' : buf += '0';
    wed ? buf += '1' : buf += '0';
    thu ? buf += '1' : buf += '0';
    fri ? buf += '1' : buf += '0';
    sat ? buf += '1' : buf += '0';
    sun ? buf += '1' : buf += '0';
    return int.parse(buf, radix: 2);
  }
}
