import 'package:flutter/material.dart';
import 'package:movie_app/screens/movie_details.dart';

class FilteredMoviesList extends StatelessWidget {
  const FilteredMoviesList({super.key, required this.movies});

  final List<dynamic> movies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final movie = movies[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetails(movie: movie),
                ),
              );
            },
            leading: Image.network(
              'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
              fit: BoxFit.cover,
              height: 50,
              width: 50,
            ),
            title: Text(
              movie['title'],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(movie['overview']),
          );
        });
  }
}
