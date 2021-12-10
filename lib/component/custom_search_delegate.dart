import 'package:flutter/material.dart';
import 'package:lembra_do_remedio/model/suggestion_model.dart';
import 'package:lembra_do_remedio/repository/suggestion_repository.dart';
import 'package:lembra_do_remedio/screen/registration_remedy/registration_remedy_screen.dart';

class SearchScreen extends SearchDelegate<String> {
  SearchScreen({String? searchFieldLabel})
      : super(
          searchFieldLabel: searchFieldLabel,
        );

  @override
  Widget buildLeading(BuildContext context) => SizedBox();

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: Colors.white,
      primaryIconTheme:
          theme.primaryIconTheme.copyWith(color: Colors.transparent),
      primaryColorBrightness: Brightness.dark,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) => [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: TextButton(
            onPressed: () async {
              var repository = SuggestionRepository();
              final resposta = await repository.fetchSuggestion(query);

              Navigator.of(context).pop();
            },
            child: Text('Pesquisar',
                style: Theme.of(context).textTheme.bodyText1!),
          ),
        ),
      ];

  @override
  Widget buildResults(BuildContext context) {
    return Container(height: 100, width: 100, color: Colors.black);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var repository = SuggestionRepository();

    return FutureBuilder<List<SuggestionModel>>(
        future: repository.fetchSuggestion(query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data != null ? snapshot.data!.length : 1,
              itemBuilder: (context, i) {
                return snapshot.data != null
                    ? InkWell(
                        onTap: () {
                          query = snapshot.data![i].nomeProduto;
                          buildResults(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => RegistrationRemedy(
                                        id: snapshot.data![i].numProcesso,
                                      )));
                        },
                        child: ListTile(
                          title: Text(snapshot.data![i].nomeProduto),
                        ),
                      )
                    : Text('Nada foi encontrado');
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),

            );
          }
        });
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   context
    //       .read(suggestionsResultsStateNotifierProvider.notifier)
    //       .fetchSuggestions(query);
    // });
    // return Consumer(
    //   builder: (context, watch, _) {
    //     final recentSearchesState = watch(recentSearchesStateNotifier);
    //     final suggestionResultsState =
    //         watch(suggestionsResultsStateNotifierProvider);
    //     return AnimatedSwitcher(
    //       duration: const Duration(milliseconds: 300),
    //       transitionBuilder: (widget, animation) => FadeTransition(
    //         opacity: animation,
    //         child: widget,
    //       ),
    //       child: suggestionResultsState.map(
    //         started: (_) => _buildRecentSearches(
    //           context: context,
    //           suggestions: recentSearchesState,
    //         ),
    //         loadInProgress: (_) =>
    //             Center(child: CremeProgressIndicatorWidget.white()),
    //         loadSuccess: (results) => _buildSearchResults(
    //           context: context,
    //           suggestions: results.searchSuggestion.suggestions,
    //         ),
    //         loadFailure: (_) => ErrorTemplateWidget(
    //           ctaButtonText: 'Refresh',
    //           retry: () {
    //             WidgetsBinding.instance!.addPostFrameCallback((_) {
    //               context
    //                   .read(suggestionsResultsStateNotifierProvider.notifier)
    //                   .fetchSuggestions(query);
    //             });
    //           },
    //           titleMessage: 'Error searching for keyword $query',
    //           descriptionMessage:
    //               'Please check your network connection and try again',
    //         ),
    //       ),
    //     );
    //   },
    // );
  }

  Widget _buildSearchResults({
    required BuildContext context,
    // required List<SuggestionModel> suggestions,
  }) {
    return Container();
    // if (suggestions.isEmpty) {
    //   return Center(child: _buildNoResults(context));
    // }

    // return _buildListingSuggestions(
    //     context: context,
    //     suggestions: suggestions.sortedBy((suggestion) {
    //       if (suggestion.value
    //           .toLowerCase()
    //           .startsWith(query.toLowerCase().trim())) {
    //         return -1;
    //       } else {
    //         if (suggestion.value
    //             .toLowerCase()
    //             .contains(query.toLowerCase().trim())) {
    //           return 0;
    //         } else {
    //           return 1;
    //         }
    //       }
    //     }).toList());
  }

  Widget _buildNoResults(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'No results for $query',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .apply(color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                'Check the spelling or try a different keyword.',
              ),
            ],
          ),
        ),
      );

  Widget _buildListingSuggestions({
    required BuildContext context,
    // required List<SuggestionModel> suggestions,
  }) {
    return Container();
    // return ListView.separated(
    //   padding: const EdgeInsets.only(right: 20, top: 30, bottom: 30),
    //   physics: const BouncingScrollPhysics(),
    //   itemCount: suggestions.length,
    //   itemBuilder: (context, index) {
    //     final suggestion = suggestions[index];
    //     return ListTile(
    //       leading: Icon(
    //         suggestion.isRecent ? CremeIcons.history : CremeIcons.search,
    //       ),
    //       title: Text(
    //         suggestion.value,
    //         style: Theme.of(context).textTheme.bodyText1,
    //       ),
    //       trailing: Text(
    //         toTitleCase(suggestion.index.shortToString()),
    //         style: Theme.of(context)
    //             .textTheme
    //             .bodyText2!
    //             .apply(color: CremeColors.white50),
    //       ),
    //       onTap: () {
    //         query = suggestion.value;
    //         showResults(context);
    //         context
    //             .read(recentSearchesStateNotifier.notifier)
    //             .saveToRecentSearches(suggestion);
    //       },
    //     );
    //   },
    //   separatorBuilder: (context, index) => Divider(
    //     indent: 20,
    //     endIndent: 10,
    //     color: CremeColors.white20,
    //   ),
    // );
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
