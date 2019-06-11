import 'package:double_list_bloc/bloc/bloc.dart';
import 'package:double_list_bloc/components/RightList/bloc/right_list_event.dart';
import 'package:flutter/material.dart';
import '../../bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeftListView extends StatefulWidget {
  LeftListView({Key key}) : super(key: key);

  _LeftListViewState createState() => _LeftListViewState();
}

class _LeftListViewState extends State<LeftListView> {
  ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    _scrollController = ScrollController();
    super.initState();
  }

  void scrollToIndex(int index, BuildContext context, int count) {
    double itemHeight = 60.0;
    double screenHight = MediaQuery.of(context).size.height -
        44 -
        MediaQuery.of(context).padding.top;

    double maxNum = screenHight / itemHeight;
    double topMaxNum = maxNum / 2;
    double bottomMaxNum = count - topMaxNum;

    if (index >= topMaxNum && index < bottomMaxNum) {
      _scrollController.animateTo(index * itemHeight - screenHight / 2,
          duration: new Duration(milliseconds: 300), curve: Curves.ease);
    } else if (index < topMaxNum) {
      if (_scrollController.offset != 0.0) {
        _scrollController.animateTo(1.0,
            duration: new Duration(milliseconds: 300), curve: Curves.ease);
      }
    } else if (index > bottomMaxNum) {
      if (_scrollController.offset <=
          count * itemHeight - maxNum * itemHeight - 100) {
        _scrollController.animateTo(count * itemHeight - maxNum * itemHeight,
            duration: new Duration(milliseconds: 300), curve: Curves.ease);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder(
        bloc: BlocProvider.of<HomeBloc>(context),
        builder: (context, state) {
          if (state is LeftListSelectItemState) {
            scrollToIndex(state.selectIndex, context, 20);
          }
          return ListView.builder(
            itemCount: 20,
            controller: _scrollController,
            primary: false,
            physics: new BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  index.toString() + '标题',
                  style: TextStyle(color: Colors.black87, fontSize: 18),
                ),
                onTap: () {
                  scrollToIndex(index, context, 20);
                  HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
                  homeBloc.dispatch(RightListSelectItemEvent(index));
                },
              );
            },
          );
        },
      ),
    );
  }
}
