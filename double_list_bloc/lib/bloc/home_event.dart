import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomeEvent {}

class SelectItemEvent extends HomeEvent {
  int selectIndex;

  SelectItemEvent(this.selectIndex);
}

class LeftListSelectItemEvent extends HomeEvent {
  int selectIndex;

  Function scrollCallBack;

  LeftListSelectItemEvent(this.selectIndex, this.scrollCallBack);
}

class RightListSelectItemEvent extends HomeEvent {
  int selectIndex;

  RightListSelectItemEvent(this.selectIndex);
}
