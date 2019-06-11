import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../bloc/home_bloc.dart';
import '../../bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RightListView extends StatefulWidget {
  RightListView({Key key}) : super(key: key);

  _RightListViewState createState() => _RightListViewState();
}

class _RightListViewState extends State<RightListView> {
  int index = 0;
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<HomeBloc>(context),
      builder: (context, state) {
        if (state is RightListSelectItemState) {
          double yyy = state.selectIndex * 500 + 0.001;
          _scrollController.animateTo(yyy,
              duration: new Duration(milliseconds: 300), curve: Curves.ease);
        }
        return NotificationListener(
          onNotification: (ScrollNotification note) {
            double screenHight = MediaQuery.of(note.context).size.height -
                44 -
                MediaQuery.of(context).padding.top;
            double xxx = (note.metrics.extentBefore + screenHight / 2) / 500;
            int indexxxx = xxx.toInt();

            if (indexxxx != index) {
              HomeBloc homeBloc = BlocProvider.of<HomeBloc>(note.context);
              homeBloc.dispatch(LeftListSelectItemEvent(indexxxx, () {}));
              index = indexxxx;
            }
          },
          child: Container(
            child: ListView.builder(
              itemCount: 20,
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    height: 500,
                    child: Row(
                      children: <Widget>[
                        Text(
                          index.toString() + "内容内容内容内容w",
                          style: TextStyle(color: Colors.black87, fontSize: 18),
                        )
                      ],
                    ));
              },
            ),
          ),
        );
      },
    );
  }
}
