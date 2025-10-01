import 'package:test/test.dart';
import 'package:unit_test/utils/time_helper.dart';

void main() {
  group("TimeHelper get time of the day test", () {
    //all the test shared tyhe same methode so add it in groupp
    test("TimeHelper should returning Morning", () {
      DateTime morningTime = DateTime(2025, 9, 30, 8);
      String time = TimeHelper.getTimeOfTheDay(dateTime: morningTime);
      expect(time, "Morning");
    });
    test("TimeHelper should returning Night", () {
      DateTime morningTime = DateTime(2025, 9, 30, 2);
      String time = TimeHelper.getTimeOfTheDay(dateTime: morningTime);
      expect(time, "Night");
    });
    test("TimeHelper should returning Afternoon", () {
      DateTime morningTime = DateTime(2025, 9, 30, 14);
      String time = TimeHelper.getTimeOfTheDay(dateTime: morningTime);
      expect(time, "Afternoon");
    });
    test("TimeHelper should returning Evening", () {
      DateTime morningTime = DateTime(2025, 9, 30, 20);
      String time = TimeHelper.getTimeOfTheDay(dateTime: morningTime);
      expect(time, "Evening");
    });
  });
}
