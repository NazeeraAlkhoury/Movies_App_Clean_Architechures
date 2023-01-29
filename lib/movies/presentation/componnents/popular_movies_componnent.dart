import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/network/api_constance.dart';

import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';
import 'package:shimmer/shimmer.dart';

class PopularMoviesComponnent extends StatefulWidget {
  const PopularMoviesComponnent({super.key});

  @override
  State<PopularMoviesComponnent> createState() =>
      _PopularMoviesComponnentState();
}

class _PopularMoviesComponnentState extends State<PopularMoviesComponnent> {
  @override
  Widget build(BuildContext context) {
    // print('MoviesBloc PopularMovies');

    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.popularMoviesrequestState !=
          current.popularMoviesrequestState,
      builder: (context, state) {
        // ignore: avoid_print
        print('popularmovies state : ${state.popularMoviesrequestState}');
        switch (state.popularMoviesrequestState) {
          case RequestState.loading:
            return const SizedBox(
              height: 170.0,
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.popularMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.popularMovies[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {},
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: ApiConstance.imageUrl(movie.backdropPath),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );

          case RequestState.error:
            return SizedBox(
              height: 170.0,
              child: Text(state.errorMessagepopularMovies),
            );
        }
      },
    );
  }
}
