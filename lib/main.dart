import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:nyumbayo_app/tools/index.dart';

import '/exports/exports.dart';
import 'Observers/IntervalObserver.dart';
import 'controllers/LandlordController.dart';
import 'controllers/TenantController.dart';
import 'firebase_options.dart';
import 'tools/Reload.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // system layout settings
  // portrait only
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // set status view
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      // statusBarIconBrightness: Brightness.light,
    ),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  messaging.requestPermission().then((value) {
    log("Enabled");
  });
  messaging.setForegroundNotificationPresentationOptions(
    alert: true, // Required to display a heads up notification
    badge: true,
    sound: true,
  );
  // initialize app notifications
  initializeNotifications();
  // end of app notification initialization

  //
  @pragma('vm:entry-point')
  void notificationTapBackground(NotificationResponse notificationResponse) {
    // handle action
  }

  Bloc.observer = const Observer();
  runApp(
    ReloadApp(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeController(),
          ),
          BlocProvider(
            create: (context) => UserdataController(),
          ),
          BlocProvider(
            create: (context) => TenantController(),
          ),
          BlocProvider(
            create: (context) => LandlordController(),
          ),
          BlocProvider(
            create: (context) => AmountController(),
          ),
          BlocProvider(
            create: (context) => PropertyController(),
          ),
          BlocProvider(
            create: (context) => PropertyIdController(),
          ),
          ChangeNotifierProvider(
            create: (context) => MainController(),
          ),
        ],
        child: BlocBuilder<ThemeController, ThemeData>(
          // overall app theme
          builder: (context, theme) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              // app theme
              theme: theme.copyWith(
                appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
                colorScheme: ColorScheme.fromSeed(
                    seedColor: const Color.fromARGB(255, 5, 70, 150)),
                useMaterial3: true,
                textTheme:
                    GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                        .apply(
                  bodyColor: theme.brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  displayColor: theme.brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
              ),
              initialRoute: Routes.onboard,
              routes: Routes.routes(context),
            );
          },
        ),
      ),
    ),
  );
}
