import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:brasiltransparenteapp/data/models/cidade_model.dart';
import 'package:brasiltransparenteapp/data/models/estado_model.dart';
import 'package:brasiltransparenteapp/store/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meta/meta.dart';

class TextFieldCidades extends StatefulWidget {

  Estado estado;
  TextFieldCidades({@required this.estado});

  @override
  _TextFieldCidadesState createState() => _TextFieldCidadesState();
}

class _TextFieldCidadesState extends State<TextFieldCidades> {
  final Home _homeStore = Home();
  AutoCompleteTextField searchTextField;
  GlobalKey<AutoCompleteTextFieldState<Cidade>> key = new GlobalKey();

  Widget row(Cidade cidade) {
    return Row(
      children: <Widget>[
        Text(cidade.nome, style: TextStyle(color: Colors.blueGrey)),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Observer(
          builder: (context) {
            return FutureBuilder<List<Cidade>>(
                future: _homeStore.recuperaCidades(widget.estado),
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
                      return searchTextField = AutoCompleteTextField<Cidade>(
                        key: key,
                        clearOnSubmit: false,
                        suggestions: snapshot.data,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        decoration: InputDecoration(
                            hintText: "Cidade",
                            hintStyle: TextStyle(color: Colors.black)),
                        itemFilter: (suggestion, query) {
                          return suggestion.nome
                              .toLowerCase()
                              .startsWith(query.toLowerCase());
                        },
                        itemSorter: (a, b) {
                          return a.nome.compareTo(b.nome);
                        },
                        itemSubmitted: (item) {
                          setState(() {
                            searchTextField.textField.controller.text =
                                item.nome;
                          });
                        },
                        itemBuilder: (context, item) {
                          return row(item);
                        },
                      );
                  }
                  return Container();
                });
          },
        ),
      ],
    );
  }
}
