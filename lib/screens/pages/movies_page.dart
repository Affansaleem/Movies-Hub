import 'package:flutter/material.dart';
import 'package:movie_app/screens/services/movie_services.dart';

import '../movie_details.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  bool _isLoading = false;
  List<dynamic> upcomingMovies = [];

  fetchData() async {
    final MovieServices services = MovieServices();
    upcomingMovies = await services.upcomingMovies();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _isLoading = true;
    });
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Upcoming Movies"),
        ),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.blueGrey,
                strokeWidth: 5,
              ))
            : GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(
                  upcomingMovies.length,
                  (index) {
                    final movie = upcomingMovies[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MovieDetails(
                                      movie: movie,
                                    )));
                      },
                      child: Card(
                        color: Colors.black12,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                              child: Image.network(
                                "https://image.tmdb.org/t/p/w500${movie['backdrop_path']}",
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 130,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                movie['title'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ));
  }
}
