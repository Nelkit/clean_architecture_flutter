
import 'package:clean_architecture_project/core/api/api_response.dart';
import 'package:clean_architecture_project/models/models.dart';
import 'package:clean_architecture_project/widgets/widgets.dart';

import 'home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => HomeViewModel()
        ),
        Consumer<HomeViewModel>(
            builder: (context, model, _){
              final viewModel = Provider.of<HomeViewModel>(context);
              ApiResponse apiResponse = viewModel.response;
              List<Movie>? movieList = apiResponse.data as List<Movie>?;

              return Scaffold(
                appBar: AppBar(
                  title: Text('Peliculas'),
                  elevation: 0,
                  actions: [
                    IconButton(onPressed: (){} , icon: Icon(Icons.search_outlined))
                  ],
                ),
                body:  MovieListView(
                  title: 'Peliculas Recientes',
                  movies: movieList,
                  status: apiResponse.status,
                )

              );
            }
        )
      ],
    );
  }
}
