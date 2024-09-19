import 'package:diskuss_task/bloc/contact_bloc.dart';
import 'package:diskuss_task/bloc/contact_event.dart';
import 'package:diskuss_task/screens/Categories/contact_screen.dart';
import 'package:diskuss_task/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  Gemini.init(apiKey: "AIzaSyD7DgQxEfrw4T6U_C8M67FNk8J_Rka4i5E");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ContactListBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          textTheme: GoogleFonts.robotoSerifTextTheme(),
        ),
        home: DashboardScreen(),
      ),
    );
  }
}
