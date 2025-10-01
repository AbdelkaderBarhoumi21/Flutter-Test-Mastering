//main the point of dperat of main like the main of app
import 'package:test/test.dart';
import 'package:unit_test/counter.dart';

void main() {
  //the descritpion because we will have many function =>Counter value should be incremented
  test("Value should start at 0", () {
    Counter counter = Counter(); //init value 0
    expect(counter.value, 0);
  });
  group("Test Counter start increnement and decremented value", () {
    test('Counter value should be incremented', () {
      Counter counter = Counter(); //init value 0
      counter.increnement(); //after increment will be 1
      expect(counter.value, 1);
    });
    test('Counter value should be decremented', () {
      Counter counter = Counter(); //init value 0
      counter.decrement(); //after increment will be 1
      expect(counter.value, -1);
    });
  });
}
