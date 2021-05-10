import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF101E33);
const inactiveCardColour = Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB1555);

enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  //Butona tıklayınca arka plan rengi değiştirme
  Color maleCardColour = inactiveCardColour;
  Color femaleCardColour=inactiveCardColour;
  //1=male and 2=female;
  void updateColour(Gender selectedGender){
    //male card pressed
    if(selectedGender ==Gender.male){
      if(maleCardColour==inactiveCardColour){
        maleCardColour=activeCardColour;
        femaleCardColour=inactiveCardColour;
      }else{
        maleCardColour=inactiveCardColour;
      }
    }
    if(selectedGender==Gender.female){
      if(femaleCardColour==inactiveCardColour){
        femaleCardColour=activeCardColour;
        maleCardColour=inactiveCardColour;
      }else {
        femaleCardColour=inactiveCardColour;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColour(Gender.male);
                      });

                    },
                    child: ReusableCard(
                      colour: maleCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColour(Gender.female);
                      });
                    },
                    child: ReusableCard(
                      colour: femaleCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      )
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ReusableCard
                colour: activeCardColour,

                )
              ),

            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColour,

                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColour,

                  ),
                ),
              ],
            )),
            Container(
              color: bottomContainerColour,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ));
  }
}




