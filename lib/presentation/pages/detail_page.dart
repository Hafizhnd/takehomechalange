import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/detail_provider.dart';
import '../providers/favorites_provider.dart';

class DetailPage extends StatefulWidget {
  final int id;
  const DetailPage({super.key, required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DetailProvider>(context, listen: false).fetchDetail(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final detail = Provider.of<DetailProvider>(context);
    final favorites = Provider.of<FavoritesProvider>(context);

    if (detail.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (detail.error != null) {
      return Scaffold(body: Center(child: Text(detail.error!)));
    }

    if (detail.character == null) {
      return const Scaffold(body: Center(child: Text("No character found")));
    }

    final c = detail.character!;
    final isFav = favorites.isFavorite(c.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(c.name),
        actions: [
          IconButton(
            icon: Icon(isFav ? Icons.favorite : Icons.favorite_border,
                color: Colors.red),
            onPressed: () {
              isFav
                  ? favorites.removeFavorite(c.id)
                  : favorites.addFavorite(c);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(20), top: Radius.circular(20)),
                child: Image.network(
                  c.image,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow("Name", c.name),
                      _buildInfoRow("Species", c.species),
                      _buildInfoRow("Gender", c.gender),
                      _buildInfoRow("Origin", c.origin),
                      _buildInfoRow("Location", c.location),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text("$label: ",
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Expanded(
            child: Text(value, style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
