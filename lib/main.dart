import 'package:fintech_app/core/bloc/loginbloc/login_bloc.dart';
import 'package:fintech_app/core/data/repositories/userDataRepository.dart';
import 'package:fintech_app/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/theme/light_theme.dart';
import 'core/bloc/phoneauthbloc/phone_auth_bloc.dart';
import 'core/bloc/registerbloc/register_bloc.dart';
import 'core/data/provider/phone_auth_firebase_provider.dart';
import 'core/data/repositories/phone_auth_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => PhoneAuthBloc(
                phoneAuthRepository: PhoneAuthRepository(
                    phoneAuthFirebaseProvider: PhoneAuthFirebaseProvider(
                        firebaseAuth: FirebaseAuth.instance)))),
        BlocProvider<LoginBloc>(
          create: (context) =>
              LoginBloc(userdataRepository: UserDataRepository()),
        ),
        BlocProvider<RegisterBloc>(
          create: (context) =>
              RegisterBloc(userdataRepository: UserDataRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fintech Mobile',
        theme: lightTheme,
        home: SplashScreen(),
      ),
    );
  }
}
