import 'package:brasiltransparenteapp/data/models/cidade_model.dart';
import 'package:brasiltransparenteapp/data/models/estado_model.dart';
import 'package:brasiltransparenteapp/screens/android/style/text_style.dart';
import 'package:flutter/material.dart';

class DropDownCityWidget extends StatefulWidget {
  @override
  _DropDownCityState createState() => _DropDownCityState();
}

class _DropDownCityState extends State<DropDownCityWidget> {
  List<Cidade> _cidades = Cidade.getCidades();
  List<DropdownMenuItem<Cidade>> _dropdownMenuItems;
  Cidade _selectCidade;

  @override
  void initState() {
    _dropdownMenuItems = builDropdownMenuItems(_cidades);
    _selectCidade = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Cidade>> builDropdownMenuItems(List cidades){
    List<DropdownMenuItem<Cidade>> items = List();
    for(Cidade cidade in cidades){
      items.add(DropdownMenuItem(
        value: cidade,
        child: Text(cidade.nome,style: styleTextDropDown,),
      ));
    }
    return items;
  }

  onChangeDropdownItem(Cidade cidade){
    setState(() {
      _selectCidade = cidade;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        DropdownButton<Cidade>(
          value: _selectCidade,
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
