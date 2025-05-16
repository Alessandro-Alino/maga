part of 'image_bloc.dart';

@freezed
class ImageEvent with _$ImageEvent {
  const factory ImageEvent.initial() = _InitialEvent;

  const factory ImageEvent.getImages() = _GetImagesEvent;

  const factory ImageEvent.getOneImage({required int id}) = _GetOneImageEvent;

  const factory ImageEvent.selectImage({ImageModel? image}) = _SelectImageEvent;
}
