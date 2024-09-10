import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../movie_details.dart';

class MoviesSlider extends StatelessWidget {
  const MoviesSlider({super.key, required this.topRatedMovies});

  final List<dynamic> topRatedMovies;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: topRatedMovies.length,
      itemBuilder: (context, index, realIndex) {
        final movie = topRatedMovies[index];
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie['backdrop_path']}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
          height: 250,
          autoPlay: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 1),
          enableInfiniteScroll: true,
          pageSnapping: true,
          viewportFraction: 0.8),
    );
  }
}
