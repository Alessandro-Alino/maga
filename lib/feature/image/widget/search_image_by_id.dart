import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maga/feature/image/bloc/image_bloc.dart';

class SearchImageByID extends StatefulWidget {
  const SearchImageByID({super.key});

  @override
  State<SearchImageByID> createState() => _SearchImageByIDState();
}

class _SearchImageByIDState extends State<SearchImageByID> {
  final TextEditingController _idCntrl = TextEditingController();

  @override
  void dispose() {
    _idCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      initialChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            children: [
              TextFormField(
                controller: _idCntrl,
                keyboardType: TextInputType.number,
                autofocus: true,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16.0),
              ActionChip(
                label: const Text('Id Immagine'),
                onPressed: () {
                  int id = int.parse(_idCntrl.text);
                  context.read<ImageBloc>().getOneImage(id: id);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
