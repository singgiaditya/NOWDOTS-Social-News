import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowdots_social_news/src/core/enums/feed_type_enums.dart';

sealed class DrawerEvent {}

final class DrawerChangeType extends DrawerEvent {
  final FeedType type;

  DrawerChangeType(this.type);
}

class DrawerBloc extends Bloc<DrawerEvent, FeedType> {
  DrawerBloc() : super(FeedType.NOWDOTS) {
    on<DrawerChangeType>((event, emit) => emit(event.type));
  }
}
