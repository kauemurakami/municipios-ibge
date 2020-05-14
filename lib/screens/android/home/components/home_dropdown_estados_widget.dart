import 'package:brasiltransparenteapp/data/models/estado_model.dart';
import 'package:brasiltransparenteapp/screens/android/style/text_style.dart';
import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  List<Estado> _estados = Estado.getEstados();
  List<DropdownMenuItem<Estado>> _dropdownMenuItems;
  Estado _selectEstado;

  @override
  void initState() {
    _dropdownMenuItems = builDropdownMenuItems(_estados);
    _selectEstado = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Estado>> builDropdownMenuItems(List estados){
    List<DropdownMenuItem<Estado>> items = List();
    for(Estado estado in estados){
      items.add(DropdownMenuItem(
        value: estado,
        child: Text(estado.nome,style: styleTextDropDown,),
      ));
    }
    return items;
  }

  onChangeDropdownItem(Estado estado){
    setState(() {
      _selectEstado = estado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        DropdownButton<Estado>(
          value: _selectEstado,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: styleTextDropDown,
          items: _dropdownMenuItems,
          underline: Container(height: 2, color: Theme.of(context).accentColor),
          onChanged: onChangeDropdownItem,
        ),
      ],
    );
  }
}
