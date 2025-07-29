import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/datasources/local_data_source.dart';
import 'data/datasources/remote_data_source.dart';
import 'data/repositories/character_repository_impl.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/pages/search_page.dart';
import 'presentation/pages/favorites_page.dart';
import 'presentation/providers/home_provider.dart';
import 'presentation/providers/search_provider.dart';
import 'presentation/providers/detail_provider.dart';
import 'presentation/providers/favorites_provider.dart';

void main() {
  final repository = CharacterRepositoryImpl(
    remote: RemoteDataSource(),
    local: LocalDataSource(),
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => HomeProvider(repository)),
      ChangeNotifierProvider(create: (_) => SearchProvider(repository)),
      ChangeNotifierProvider(create: (_) => DetailProvider(repository)),
      ChangeNotifierProvider(create: (_) => FavoritesProvider(repository)),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    SearchPage(),
    FavoritesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.lightBlue,
          foregroundColor: Colors.white,
        ),
      ),
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (i) => setState(() => _selectedIndex = i),
          selectedItemColor: Colors.lightBlue,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
          ],
        ),
      ),
    );
  }
}
