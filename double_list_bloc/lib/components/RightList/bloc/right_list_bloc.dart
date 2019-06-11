import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class RightListBloc extends Bloc<RightListEvent, RightListState> {
  @override
  RightListState get initialState => InitialRightListState();

  @override
  Stream<RightListState> mapEventToState(
    RightListEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
