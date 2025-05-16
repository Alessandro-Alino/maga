import 'package:flutter/material.dart';

class UploadImage extends StatelessWidget {
  const UploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            scrolledUnderElevation: 0.0,
            leading: const SizedBox.shrink(),
            title: const Text('Upload Foto'),
            backgroundColor: Colors.transparent,
          ),
          body: ListView.builder(
            itemCount: 150,
            itemBuilder: (context, index) {
              return ListTile(title: Text('Foto ${index + 1}'));
            },
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              spacing: 8.0,
              children: [
                // Go Back
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Indietro'),
                  ),
                ),
                // Upload Photo
                Expanded(
                  child: FilledButton(
                    onPressed: () {},
                    child: const Text('Upload'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
