import 'package:brasiltransparenteapp/data/models/cidade_model.dart';
import 'package:brasiltransparenteapp/screens/android/style/text_style.dart';
import 'package:brasiltransparenteapp/store/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DropDownCityWidget extends StatelessWidget {
  final Home _homeStore = Home();
  
  List<DropdownMenuItem<Cidade>> builDropdownMenuItems(List<Cidade> cidades) {
    List<DropdownMenuItem<Cidade>> items = List();
    for (Cidade cidade in cidades) {
      items.add(DropdownMenuItem(
        value: cidade,
        child: Text(
          cidade.nome,
          style: styleTextDropDown,
        ),
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return FutureBuilder<List<Cidade>>(
          future: _homeStore.getCidades,
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
                return Observer(builder: (context) {
                  return Row(
                    children: <Widget>[
                      DropdownButton<Cidade>(
                          value: _homeStore.getSelectedCidade,
                          hint: Text("Selecione a cidade"),
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: styleTextDropDown,
                          items: builDropdownMenuItems(snapshot.data),
                          underline: Container(
                              height: 2, color: Theme.of(context).accentColor),
                          onChanged: (value) {
                            print(value.nome);
                            _homeStore.onChangeDropdownItemC(value);
                            print(_homeStore.getSelectedCidade);
                          }),
                    ],
                  );
                });
            }
            return Container();
          });
    });
  }
}
