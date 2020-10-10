import 'package:bigBobble/providers/messageProvider.dart';
import 'package:bigBobble/screens/pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NameProvider()),
      ],
      child: MaterialApp(
        title: 'bigBobble',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
          accentColor: Color(0xFFFEF9EB),
        ),
        onGenerateRoute: routes,
      ),
    );
  }

  Route routes(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        switch (settings.name) {
          case '/':
            {
              return HomeScreen();
            }
          case Story.storyRoute:
            {
              return Story(file: settings.arguments);
            }
          case ChatScreen.chatScreenRoute:
            {
              return ChatScreen(user: settings.arguments);
            }
          default:
            {
              return HomeScreen();
            }
        }
      },
    );
  }
}
