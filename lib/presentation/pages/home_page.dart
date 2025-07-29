import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/home_provider.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false).fetchInitialCharacters();
    });
  }


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final home = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Rick & Morty"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundImage: home.characters.isNotEmpty
              ? NetworkImage(home.characters.first.image)
              : const NetworkImage(
                  "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
            ),
          )
        ],
      ),
      body: home.error != null
          ? Center(child: Text(home.error!))
          : _buildGroupedList(home),
    );
  }

  Widget _buildGroupedList(HomeProvider home) {
    final Map<String, List> grouped = {};

    for (var c in home.characters) {
      final location = c.location.isNotEmpty ? c.location : "Unknown";
      grouped.putIfAbsent(location, () => []).add(c);
    }

    return ListView(
      controller: _scrollController,
      children: [
        ...grouped.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  entry.key,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: entry.value.length,
                  itemBuilder: (context, index) {
                    final c = entry.value[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DetailPage(id: c.id)),
                      ),
                      child: Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: SizedBox(
                          width: 140,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  c.image,
                                  height: 140,
                                  width: 140,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  c.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }),
        if (home.isLoading)
          const Padding(
            padding: EdgeInsets.all(20),
            child: Center(child: CircularProgressIndicator()),
          ),
      ],
    );
  }
}
