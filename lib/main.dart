import 'package:azkar_app/cubit/LocaleCubit/locale_cubit.dart';
import 'package:azkar_app/cubit/navigation_cubit.dart';
import 'package:azkar_app/generated/intl/messages_all.dart';
import 'package:azkar_app/generated/l10n.dart';
import 'package:azkar_app/view/favorites_screen.dart';
import 'package:azkar_app/view/home_screen.dart';
import 'package:azkar_app/view/profile_screen.dart';
import 'package:azkar_app/view/search_screen.dart';
import 'package:azkar_app/widget/custom_bottom_navi_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = 'en';
  await initializeMessages('en');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider(
          create: (context) => LocaleCubit(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: locale,
            localizationsDelegates: const [
              // Add the Flutter localization delegates
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              // Add your custom localization delegate
              S.delegate,
              //AppLocalizationDelegate(),
            ],
            supportedLocales: const [
              // Define the supported locales (English and Arabic)
              Locale('en', ''), // English
              Locale('ar', ''), // Arabic
            ],
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final customBottomNavigationBarItems = [
      
      
      CustomBottomNavigationBarItem(iconData: Icons.favorite),
      CustomBottomNavigationBarItem(iconData: Icons.import_contacts),
      CustomBottomNavigationBarItem(iconData: Icons.home),
      CustomBottomNavigationBarItem(iconData: Icons.person),
    ];

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Azkar',
      //     style: TextStyle(fontSize: 22),
      //   ),
      //   centerTitle: true,
      // ),
      body: BlocBuilder<NavigationCubit, NavigationItem>(
        builder: (context, selectedItem) {
          return _buildCurrentPage(context, selectedItem);
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationItem>(
        builder: (context, selectedItem) {
          return CustomBottomNavigationBar(
            selectedItem: selectedItem,
            onItemTapped: (item) {
              BlocProvider.of<NavigationCubit>(context).setNavigationItem(item);
            },
            items: customBottomNavigationBarItems,
          );
        },
      ),
    );
  }

  Widget _buildCurrentPage(BuildContext context, NavigationItem selectedItem) {
    switch (selectedItem) {
      case NavigationItem.home:
        return const HomeScreen();
      case NavigationItem.search:
        return const SearchScreen();
      case NavigationItem.favorites:
        return const FavoritesScreen();
      case NavigationItem.profile:
        return  const ProfileScreen();
    }
  }
}
