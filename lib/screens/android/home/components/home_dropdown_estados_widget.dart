import 'package:brasiltransparenteapp/data/models/estado_model.dart';
import 'package:brasiltransparenteapp/screens/android/style/text_style.dart';
import 'package:brasiltransparenteapp/store/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DropDownWidget extends StatelessWidget {
  final Home _homeStore = Home();

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
                return Observer(
                  builder:(context){
                    return Row(
                    children: <Widget>[
                        DropdownButton<Estado>(
                            value: _homeStore.getSelectedEstado,
                            hint: Text("Selecione seu estado"),
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            style: styleTextDropDown,
                            items: builDropdownMenuItems(snapshot.data),
                            underline: Container(
                                height: 2,
                                color: Theme.of(context).accentColor),
                            onChanged: (value) {
                              print(value.nome);
                              _homeStore.onChangeDropdownItemE(value);
                              print(_homeStore.getSelectedEstado.sigla);
                            }),
                    ],
                  );
                  } 
                );
            }
            return Container();
          });
    });
  }
}
