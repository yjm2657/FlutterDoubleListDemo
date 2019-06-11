import 'package:flutter/material.dart';
import '../components/LeftList/left_list.dart';
import '../components/RightList/right_list.dart';
import '../bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageView extends StatefulWidget {
  HomePageView({Key key}) : super(key: key);

  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  HomeBloc _homeBloc;

  @override
  void initState() {
    // TODO: implement initState
    _homeBloc = HomeBloc();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _homeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _homeBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('DoubleList'),
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: 100,
              child: LeftListView(),
            ),
            Positioned(
              left: 100,
              top: 0,
              bottom: 0,
              right: 0,
              child: RightListView(),
            ),
          ],
        ),
      ),
    );
  }
}
