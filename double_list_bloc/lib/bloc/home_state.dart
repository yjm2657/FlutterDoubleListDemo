import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomeState {}

class InitialHomeState extends HomeState {}

class LeftListSelectItemState extends HomeState {
  int _selectIndex = 0;

  Function _scrollCallBack;

  int get selectIndex => _selectIndex;

  Function get scrollCallBack => _scrollCallBack;

  LeftListSelectItemState(this._selectIndex, this._scrollCallBack);
}

class RightListSelectItemState extends HomeState {
  int _selectIndex = 0;

  int get selectIndex => _selectIndex;

  RightListSelectItemState(this._selectIndex);
}
