import 'package:flutter/material.dart';
import 'package:movie_app/screens/services/movie_services.dart';
import 'package:movie_app/screens/widgets/filtered_movies_list.dart';
import 'package:movie_app/screens/widgets/horizontal_view_scroll.dart';
import 'package:movie_app/screens/widgets/movie_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> popularMovies = [];
  List<dynamic> topRatedMovies = [];
  List<dynamic> upcomingMovies = [];
  List<dynamic> similarMovies = [];
  List<dynamic> filteredMovies = [];
  bool _isSearchEmpty = true;
  bool _isLoading = false;
  final TextEditingController _controller = TextEditingController();

  void filterMovies(String query) {
    setState(() {
      filteredMovies = popularMovies
          .where((movies) =>
              movies['title'].toLowerCase().contains(query.toLowerCase()))
          .toList();
      topRatedMovies = topRatedMovies
          .where((movies) =>
              movies['title'].toLowerCase().contains(query.toLowerCase()))
          .toList();
      upcomingMovies = upcomingMovies
          .where((movies) =>
              movies['title'].toLowerCase().contains(query.toLowerCase()))
          .toList();
      if (query.isEmpty) {
        _isSearchEmpty = true;
      } else {
        _isSearchEmpty = false;
      }
    });
  }

  fetchMovies() async {
    MovieServices services = MovieServices();
    setState(() {
      _isLoading = true;
    });
    popularMovies = await services.popularMovies();
    topRatedMovies = await services.topRatedMovies();
    upcomingMovies = await services.upcomingMovies();
    setState(() {
      _isLoading = false;
    });
  }

  Widget searchBar() {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(16), boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: const Offset(0, 3),
            spreadRadius: 2,
            blurRadius: 5)
      ]),
      child: TextField(
        controller: _controller,
        onChanged: (value) {
          if (value.isEmpty) {
            setState(() {
              _isSearchEmpty = true;
            });
          } else {
            setState(() {
              _isSearchEmpty=false;
              filterMovies(value);
            });

          }
        },
        decoration: InputDecoration(
          hintText: "Search movies",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), // Rounded corners
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          searchBar(),
          _isLoading
              ? const CircularProgressIndicator(
                  color: Colors.grey,
                )
              : !_isSearchEmpty
                  ? Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Filtered Movies",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        FilteredMoviesList(movies: filteredMovies),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            'Top rated Movies',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        MoviesSlider(topRatedMovies: topRatedMovies),
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            'Upcoming Movies',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        HorizontalView(upcomingMovies: upcomingMovies),
                        // Popular Movies
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            'Popular Movies',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        HorizontalView(upcomingMovies: popularMovies),
                      ],
                    ),
        ],
      ),
    );
  }
}
