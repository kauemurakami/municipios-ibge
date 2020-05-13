import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentStep = 0;

  List<Step> _mySteps() {
    List<Step> _steps = [
      Step(
        title: Text("Escolha seu estado"),
        content: RaisedButton(
          onPressed: () {},
          child: Text("Teste"),
          color: Colors.black,
        ),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: Text("Escolha sua cidade"),
        content: RaisedButton(
          onPressed: () {},
          child: Text("Teste"),
          color: Colors.black,
        ),
        isActive: _currentStep >= 1,
      )
    ];
    return _steps;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stepper(
      
        onStepTapped: (step){
          setState(() {
            this._currentStep = step;
          });
        },
        onStepContinue: ,
        steps: _mySteps(),
        currentStep: this._currentStep,
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
          },
          child: Icon(
            Icons.search,
            color: Colors.white,
          )),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.info,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ]),
      ),
    );
  }
}
