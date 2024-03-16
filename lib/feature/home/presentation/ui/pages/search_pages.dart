import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/feature/home/presentation/state/search_movie/search_movie_bloc.dart';
import 'package:movie/feature/home/presentation/widget/item_movie.dart';

class SearchPages extends StatelessWidget {
  SearchPages({super.key});

  final TextEditingController _searchController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context
            .read<SearchMovieBloc>()
            .add(SearchPagination(query: _searchController.text));
      }
    });
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                prefixIcon: Icon(Icons.search),
                hintText: 'Название фильма',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => context.read<SearchMovieBloc>().add(
                    SearchTextChanged(query: value),
                  ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: BlocBuilder<SearchMovieBloc, SearchMovieState>(
                builder: (context, state) {
                  return switch (state) {
                    SearchMovieInitial() => const SizedBox(),
                    SearchMovieLoading() => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    SearchMovieSuccess(movies: final movieList) =>
                      ListView.builder(
                        controller: _scrollController,
                        itemCount: movieList.movieList.length,
                        itemBuilder: (context, index) {
                          return ItemMovie(
                            item: movieList.movieList[index],
                          );
                        },
                      ),
                    SearchMovieError(:final message) => Center(
                        child: Text(message),
                      ),
                  };
                },
              ),
            ),
            BlocBuilder<SearchMovieBloc, SearchMovieState>(
              builder: (context, state) {
                return switch (state) {
                  SearchMovieSuccess(:bool isLoading) => isLoading
                      ? const Padding(
                          padding: EdgeInsets.only(bottom: 8, top: 2),
                          child: CircularProgressIndicator(),
                        )
                      : const SizedBox(),
                  _ => const SizedBox()
                };
              },
            )
          ],
        ),
      ),
    );
  }
}
