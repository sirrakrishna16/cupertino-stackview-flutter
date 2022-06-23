import'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rxdart/subjects.dart';

class SpinWheel extends StatefulWidget {
  const SpinWheel({ Key? key }) : super(key: key);

  @override
  State<SpinWheel> createState() => _SpinWheelState();
}

class _SpinWheelState extends State<SpinWheel> {
final selected= BehaviorSubject<int>();
int rewards=0;
  List<int> items=[100,200,300,400,500,600,700,800,900,1000];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fortune Wheel"),
      ),
      body:Center(
        child:Column(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height:500,
              child: FortuneWheel(
                selected: selected.stream ,
                animateFirst: false,
                items: [
                for(int i=0; i<items.length; i++)...<FortuneItem>
                 { FortuneItem(child:Text(items[i

                 ].toString())),},

              ],

              onAnimationEnd: (){
                setState(() {
                  rewards = items[selected.value];
                  
                });
                print(rewards);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Spin Value:"+rewards.toString(),))
                );

              },
              ),
            ),

            GestureDetector(
              onTap: (){
                 setState(() {
                   selected.add(Fortune.randomInt(0, items.length));
                 });
              },
              child:Container(
                height: 40,
                width:120,
                color:Colors.amber,
                child:Center(child: Text("SPIN"),)
              ) ,
            )
          ],
        )
      )
      
    );
  }
}