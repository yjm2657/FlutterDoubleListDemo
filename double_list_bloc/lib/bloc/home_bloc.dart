import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => InitialHomeState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    // TODO: Add Logic
    if (event is LeftListSelectItemEvent) {
      yield LeftListSelectItemState(event.selectIndex, event.scrollCallBack);
    } else if (event is RightListSelectItemEvent) {
      yield RightListSelectItemState(event.selectIndex);
    }
  }
}
