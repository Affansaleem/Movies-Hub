import 'package:flutter/material.dart';
import 'package:movie_app/screens/services/movie_services.dart';
import 'package:movie_app/screens/widgets/horizontal_view_scroll.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key, required this.movie});

  final dynamic movie;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  List<dynamic> movies = [];
  bool _isLoading = false;

  _getData() async {
    setState(() {
      _isLoading = true;
    });
    final MovieServices services = MovieServices();
    movies = await services.similarMovies(widget.movie['id']);
    setState(() {
      _isLoading = false;
    });
  }


  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie['title']),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'https://image.tmdb.org/t/p/w500${widget.movie['backdrop_path']}',
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
              const SizedBox(
                height: 20,
              ),
              Text('Title: ${widget.movie['title']}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              const SizedBox(
                height: 10,
              ),
              Text('Overview: ${widget.movie['overview']}'),
              const SizedBox(
                height: 10,
              ),
              Text('Release: ${widget.movie['release_date']}'),
              const SizedBox(
                height: 10,
              ),
              Text('Rating: ${widget.movie['vote_average']}'),
              const SizedBox(
                height: 10,
              ),
              Text('Reviews Count: ${widget.movie['vote_count']}'),
              const SizedBox(
                height: 10,
              ),
              Text('Popularity: ${widget.movie['popularity']}'),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Similar Movies',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : HorizontalView(upcomingMovies: movies),
            ],
          ),
        ),
      ),
    );
  }
}
