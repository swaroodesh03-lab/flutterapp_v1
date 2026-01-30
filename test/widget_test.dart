import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapp_v1/main.dart';

void main() {
  testWidgets('MagicBooks home page smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MagicBooksApp());

    // Verify that the title is present.
    expect(find.text('MagicBooks'), findsWidgets);
    
    // Verify that the start button is present.
    expect(find.text('Start Creating'), findsWidgets);
  });
}
