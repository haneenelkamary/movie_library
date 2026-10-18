import 'package:flutter/material.dart';
import 'movie.dart';
import 'movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isGridView = false;
  String searchText = '';
  int discount = 20;

  @override
  Widget build(BuildContext context) {
    final filteredMovies = movies.where((movie) {
      final query = searchText.trim().toLowerCase();
      return movie.title.toLowerCase().contains(query) ||
          movie.genre.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Library', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            tooltip: isGridView ? 'Switch to list view' : 'Switch to grid view',
            icon: Icon(isGridView ? Icons.view_list : Icons.grid_view),
            onPressed: () => setState(() => isGridView = !isGridView),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => setState(() => searchText = value),
              decoration: InputDecoration(
                hintText: 'Search movies...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Theme.of(context).cardColor,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: Colors.grey.shade300)),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: filteredMovies.isEmpty
                  ? const Center(child: Text('No movies found', style: TextStyle(fontSize: 16, color: Colors.grey)))
                  : isGridView
                      ? GridView.builder(
                          itemCount: filteredMovies.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            mainAxisExtent: 330,
                          ),
                          itemBuilder: (context, index) => MovieCard(
                            movie: filteredMovies[index],
                            isGrid: true,
                            discount: discount,
                            onDiscountTap: () => setState(() => discount = discount > 0 ? discount - 1 : 20),
                          ),
                        )
                      : ListView.builder(
                          itemCount: filteredMovies.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: SizedBox(
                              height: 174,
                              child: MovieCard(
                                movie: filteredMovies[index],
                                isGrid: false,
                                discount: discount,
                                onDiscountTap: () => setState(() => discount = discount > 0 ? discount - 1 : 20),
                              ),
                            ),
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
