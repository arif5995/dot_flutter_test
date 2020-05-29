import 'package:dotfluttertest/core/model/places_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
abstract class PlaceState extends Equatable{}

class PlaceInitialState extends PlaceState {
  @override
  List<Object> get props => [];
}

class PlaceLoadingState extends PlaceState {
  @override
  List<Object> get props => [];
}

class PlaceLoadedState extends PlaceState {
  final List<Place> place;

  PlaceLoadedState({this.place});

  @override
  List<Object> get props => [place];
}

class PlaceErrorState extends PlaceState {
  final String message;

  PlaceErrorState({this.message});

  @override
  List<Object> get props => [message];
}





