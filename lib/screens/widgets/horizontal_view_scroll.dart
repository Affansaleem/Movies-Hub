import 'package:flutter/material.dart';
import 'package:movie_app/screens/movie_details.dart';

class HorizontalView extends StatelessWidget {
  const HorizontalView({super.key, required this.upcomingMovies});

  final List<dynamic> upcomingMovies;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(upcomingMovies.length, (index) {
          final movie = upcomingMovies[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetails(
                    movie: movie,
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Image.network(
                      'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
                      width: 150,
                      height: 200,
                      fit: BoxFit.cover),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    child: Text(
                      movie['title'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
