import 'package:flutter_bloc/flutter_bloc.dart';

sealed class DrawerEvent {}

final class DrawerChangeIndex extends DrawerEvent {
  final int index;

  DrawerChangeIndex(this.index);
  
}

class DrawerBloc extends Bloc<DrawerEvent, int> {
  DrawerBloc() : super(0) {
    on<DrawerChangeIndex>((event, emit) => emit(event.index));
  }
}
