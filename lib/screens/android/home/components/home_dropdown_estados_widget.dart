import 'package:brasiltransparenteapp/data/models/estado_model.dart';
import 'package:brasiltransparenteapp/screens/android/style/text_style.dart';
import 'package:brasiltransparenteapp/store/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DropDownWidget extends StatelessWidget {
  final Home _homeStore = Home();
  Estado _selectedEstado;
  //List<Estado> _estados = Estado.getEstados();
  List<DropdownMenuItem<Estado>> builDropdownMenuItems(List<Estado> estados) {
    List<DropdownMenuItem<Estado>> items = List();
    for (Estado estado in estados) {
      items.add(DropdownMenuItem(
        value: estado,
        child: Text(
          estado.nome,
          style: styleTextDropDown,
        ),
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return FutureBuilder<List<Estado>>(
          future: _homeStore.getEstados,
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
                              return Row(
                  children: <Widget>[
                    DropdownButton<Estado>(
                        value: _homeStore.getSelectedEstado,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: styleTextDropDown,
                        items: builDropdownMenuItems(snapshot.data),
                        underline: Container(
                            height: 2, color: Theme.of(context).accentColor),
                        onChanged: (value) {
                          _homeStore.onChangeDropdownItem(value);
                          print(value.nome);
                          print(_homeStore.getSelectedEstado.nome);
                        }),
                  ],
                );
            }
            return Container();
          });
    });
  }
}
