import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maga/feature/category/widget/categ_image.dart';
import 'package:maga/feature/image/bloc/image_bloc.dart';
import 'package:maga/feature/image/model/image_model.dart';

class SelectedImage extends StatelessWidget {
  const SelectedImage({super.key, required this.imageSel});

  final ImageModel? imageSel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageBloc, ImageState>(
      builder: (context, state) {
        return AnimatedPositioned(
          duration: Durations.long4,
          right: state.selectedImage != null ? 0 : -500,
          curve: Curves.easeInOut,
          child: Stack(
            children: [
              // Selected Image
              CategImage(
                src: imageSel?.guid.rendered,
                width: 250.0,
                height: 250.0,
              ),
              // Cancel Image Selection
              Positioned(
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    context.read<ImageBloc>().selectImage(image: null);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                          offset: Offset(
                            0.0,
                            1.0,
                          ), // shadow direction: bottom right
                        ),
                      ],
                      color: Colors.red,
                    ),
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(Icons.close, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
