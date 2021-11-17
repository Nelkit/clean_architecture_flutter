import 'package:clean_architecture_project/core/api/api_response.dart';
import 'package:clean_architecture_project/models/models.dart';
import 'package:clean_architecture_project/widgets/molecules/movie_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({Key? key, this.title, required this.movies, required this.status}) : super(key: key);

  final List<Movie>? movies;
  final String? title;
  final Status status;

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  @override
  Widget build(BuildContext context) {

    switch (widget.status) {
      case Status.LOADING:
        return const Center(child: CircularProgressIndicator());
      case Status.COMPLETED:
         return Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _createTitle(widget.title),
              Expanded(
                child: GridView.builder(
                  itemCount: widget.movies!.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: ( _, int index) => MovieItem(movie:  widget.movies![index],),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (1 / 1.3)
                  ),
                ),
              )
            ],
          ),
        );
      case Status.ERROR:
        return const Center(
          child: Text('Please try again latter!!!'),
        );
      default:
        return const Center(
          child: Text('Search the song by Artist'),
        );
    }


  }

  Widget _createTitle(String? title )  {
    if (title == null) {
      return Container();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
    );
  }
}

