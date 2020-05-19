import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:brasiltransparenteapp/data/models/cidade_model.dart';
import 'package:brasiltransparenteapp/helpers/g_keys.dart';
import 'package:brasiltransparenteapp/store/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../../../../theme/app_theme.dart';
import '../../style/text_style.dart';

class TextFieldCidades extends StatelessWidget {

  AutoCompleteTextField<Cidade> textField;

  Cidade selectedCidade;

  @override
  Widget build(BuildContext context) {
    final Home _homeStore = Provider.of<Home>(context);

    return FutureBuilder(
      future: _homeStore.recuperaCidades(_homeStore.selectedEstado),
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
            return textField = AutoCompleteTextField<Cidade>(
                  style: styleTextDropDown,
                  decoration: InputDecoration(
                      fillColor: appThemeData.accentColor,
                      border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: appThemeData.accentColor))),
                  itemSubmitted: (item) {
                    _homeStore.selectedCidade = item;
                    _homeStore.incrementStep();
                    print(_homeStore.selectedCidade.nome);
                  },
                  key: GKeys.gKey1,
                  suggestions: snapshot.data,
                  itemBuilder: (context, suggestion) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        suggestion.nome,
                        style: styleTextDropDown,
                      ),
                    );
                  },
                  itemSorter: (a, b) => a.nome.compareTo(b.nome),
                  itemFilter: (suggestion, query) => suggestion.nome
                      .toLowerCase()
                      .startsWith(query.toLowerCase()),
            );
        }
        return Container();
      },
    );
  }
}
