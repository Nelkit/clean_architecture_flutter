import 'package:clean_architecture_project/models/models.dart';
import 'package:clean_architecture_project/views/detail/detail_view_model.dart';
import 'package:clean_architecture_project/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie? movie = ModalRoute.of(context)?.settings.arguments as Movie;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => DetailViewModel()
        ),
        Consumer<DetailViewModel>(
            builder: (context, model, _){
              final viewModel = Provider.of<DetailViewModel>(context);
              return Scaffold(
                body: CustomScrollView(
                  slivers: [
                    _CustomAppBar(movieTitle: movie!.title, moviePosterImage: movie.fullPosterImage, ),
                    SliverList(delegate: SliverChildListDelegate([
                      Container(
                        padding:  EdgeInsets.only(left: 0, top: 0, right: 20, bottom: 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _LikeBoxView(likes: viewModel.likes,),
                            LikeButton(
                              onPressed: (BuildContext ) {
                                viewModel.onLiked();
                                },
                              color: Colors.red,
                              background: Color.fromRGBO(100, 100, 38, 0.2),
                              screenContext: context,
                            ),
                          ],
                        ),
                      ),
                      _Overview(movieDescrip: movie.overview),
                    ])
                    )
                  ],
                ),
              );
            }
        )
      ],
    );
  }
}

class _LikeBoxView extends StatelessWidget {
  const _LikeBoxView({Key? key, required this.likes}) : super(key: key);
  final int likes;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, top: 20, right: 30, bottom: 10),
      child: Text(
        'Me Gusta: ${likes}',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key? key, required this.movieTitle, required this.moviePosterImage}) : super(key: key);
  final String movieTitle;
  final String moviePosterImage;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 18),
            color: Colors.black12,
            child: Text(
              movieTitle,
              style: TextStyle(fontSize: 16),
            )
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(moviePosterImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({Key? key, required this.movieDescrip}) : super(key: key);
  final String movieDescrip;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        movieDescrip,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}


