// test must be added to pubspec dev_dependencies, beware versioning as must match
//  flutter_test compatibility version.
//  flutter_test compatibility version.
import 'package:test/test.dart';
import 'package:explorations/unit_testing/character_model.dart';

void main() {
  test('Character properties correctly set from JSON constructor', () {
    const name = "testchar";
    const height = "10";
    const gender = "yes";
    final character = Character.fromJSON({
      'name': name,
      'height': height,
      'gender': gender
    });
    expect(character.name, name);
    expect(character.gender, gender);
    expect(character.height, int.parse(height));
  });
}


//
//void main() {
//  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//    // Build our app and trigger a frame.
//    await tester.pumpWidget(Explor());
//  });
//}
