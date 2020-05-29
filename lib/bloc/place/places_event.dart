import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PlaceEvent extends Equatable{}

class FetchPlaceEvent extends PlaceEvent{
  @override
  List<Object> get props => null;

}