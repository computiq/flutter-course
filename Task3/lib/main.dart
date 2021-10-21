import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/weather_cubit.dart';
import 'di/initialize_dependency.dart';
import 'pages/home_page.dart';
import 'services/repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependency();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (BuildContext context) =>
                    WeatherCubit(injector.get<IRepository>()),
              ),
            ],
            child: const MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Weather App',
              home: HomePage(),
            )));
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: lightMode
          ? Color(0x000000).withOpacity(1.0)
          : Color(0x000000).withOpacity(1.0),
      body: Center(
          child: lightMode
              ? Image.asset('images/splash.png')
              : Image.asset('images/splash.png')),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    await Future.delayed(const Duration(seconds: 5));
  }
}
