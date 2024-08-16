


import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/home/home_event.dart';
import 'package:practice/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState> {

  HomeBloc():super(HomeInitialState()){
    on<HomeScreenRefreshEvent>(homeRefresh);
  }


  FutureOr<void> homeRefresh(HomeScreenRefreshEvent event, Emitter<HomeState> emit) {
    emit.call(HomeLoadingState());
    print("======home===Refresh=====");
  }
}

mixin class A {
  void m1(){
  }
  void m2(){}
}


class B extends A{

}