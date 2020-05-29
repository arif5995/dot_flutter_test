import 'package:dotfluttertest/core/model/gallery_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
abstract class GalleryState extends Equatable{}

class GalleryInitialState extends GalleryState {
  @override
  List<Object> get props => [];
}

class GalleryLoadingState extends GalleryState {
  @override
  List<Object> get props => [];
}

class GalleryLoadedState extends GalleryState {
  final List<Gallery> gallery;

  GalleryLoadedState({this.gallery});

  @override
  List<Object> get props => [gallery];
}

class GalleryErrorState extends GalleryState {
  final String message;

  GalleryErrorState({this.message});

  @override
  List<Object> get props => [message];
}





