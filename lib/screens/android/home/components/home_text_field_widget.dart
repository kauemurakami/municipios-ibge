import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:brasiltransparenteapp/data/models/cidade_model.dart';
import 'package:brasiltransparenteapp/store/home/home.dart';
import 'package:flutter/material.dart';

class TextFieldCidades extends StatefulWidget {
  final Home homeStore;

  TextFieldCidades({this.homeStore});

  @override
  _TextFieldCidadesState createState() => _TextFieldCidadesState();
}

class _TextFieldCidadesState extends State<TextFieldCidades> {
  GlobalKey key = new GlobalKey<AutoCompleteTextFieldState<Cidade>>();

  AutoCompleteTextField<Cidade> textField;

  Cidade selectedCidade;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.homeStore.recuperaCidades(widget.homeStore.selectedEstado),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.done:
            print('widget');
            print(snapshot);
            return Text(widget.homeStore.selectedEstado.sigla);
        }
        return Container();
      },
    );
  }
}
