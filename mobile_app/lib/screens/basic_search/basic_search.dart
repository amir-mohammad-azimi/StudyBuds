import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buds/blocs/basic_search/bloc/basic_search_bloc.dart';
import 'package:study_buds/widgets/group_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BasicSearchPage(key: Key('search_page'), title: "heyy"),
    );
  }
}

class BasicSearchPage extends StatelessWidget {
  const BasicSearchPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BasicSearchBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Search for a study group',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          foregroundColor: Theme.of(context).primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _SearchBar(),
              const SizedBox(height: 20),
              Expanded(child: _SearchResults()),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: Key('search_bar'),
      controller: _searchController,
      onSubmitted: (String query) {
        context.read<BasicSearchBloc>().add(SearchQueryChanged(query, 123));
      },
      decoration: InputDecoration(
        hintText: 'Search...',
        suffixIcon: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () => _searchController.clear(),
        ),
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}

class _SearchResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicSearchBloc, BasicSearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return Center(child: Text('Enter a query to search for groups.'));
        } else if (state is SearchLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is SearchSuccess) {
          final results = state.results;
          if (results.isEmpty) {
            return Column(
              key: Key('no_results_column'),
              children: [
                Center(
                  key: Key('no_results_message'),
                  child: Text('No results found.'),
                ),
                Expanded(
                  child: ListView.builder(
                    key: Key('search_results'),
                    itemCount: 0,
                    itemBuilder: (context, index) {
                      return SizedBox.shrink();
                    },
                  ),
                ),
              ],
            );
          }
          return ListView.builder(
            key: Key('search_results'),
            itemCount: results.length,
            itemBuilder: (context, index) {
              final group = results[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GroupCard(key: Key("search_result_$index"), group: group),
                  Divider(),
                ],
              );
            },
          );
        } else if (state is SearchFailure) {
          return Center(child: Text('Error: ${state.error}'));
        } else {
          return Center(child: Text('Unknown state.'));
        }
      },
    );
  }
}
