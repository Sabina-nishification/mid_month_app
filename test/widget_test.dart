
import 'package:flutter_test/flutter_test.dart';

import 'package:mid_month_app/main.dart';

void main() {
  testWidgets('Check if Welcome message is displayed', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the "Welcome!!" text is displayed on the screen.
    expect(find.text('Welcome!!'), findsOneWidget);
    expect(find.text('Some other text'), findsNothing);  // Modify if needed for other content.
  });
}
