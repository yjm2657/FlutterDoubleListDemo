import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class LeftListBloc extends Bloc<LeftListEvent, LeftListState> {
  @override
  LeftListState get initialState => InitialLeftListState();

  @override
  Stream<LeftListState> mapEventToState(
    LeftListEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
