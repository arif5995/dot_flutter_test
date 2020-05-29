import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class GalleryEvent extends Equatable{}

class FetchGalleryEvent extends GalleryEvent{
  @override
  List<Object> get props => null;

}