import 'package:flutter/material.dart';
import '../blocs/bloc_provider.dart';
import '../blocs/home_bloc.dart';
import '../models/home_model.dart';
import 'home_grid_view_item.dart';

class HomeListPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeBloc movieBloc = BlocProvider.of<HomeBloc>(context)!;
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: const Color(0xFFECEEF1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset('assets/icon_top_bar.png'),
            Expanded(
              child: StreamBuilder<List<HomeModel>>(
                stream: movieBloc.outModelList,
                builder: (BuildContext context,
                    AsyncSnapshot<List<HomeModel>> snapshot) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(4),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return _buildMovieCard(
                        context,
                        movieBloc,
                        index,
                        snapshot.data?[index],
                      );
                    },
                    itemCount:
                        snapshot.data == null ? 0 : snapshot.data!.length,
                  );
                },
              ),
            ),
            Image.asset('assets/icon_bottom_bar.png'),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieCard(
    BuildContext context,
    HomeBloc movieBloc,
    int index,
    HomeModel? model,
  ) {
    return HomeGridViewItem(
      key: Key('${model?.id ?? 0}'),
      model: model,
      onPressed: () {},
    );
  }
}
