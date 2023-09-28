import 'dart:math';
import 'package:flutter/material.dart';
import 'package:joke_single_serving/modal/story.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Story> storyList = <Story>[];
  final List<Story> storyReaded = <Story>[];

  var current = 0;
  Story story1 =  Story(1, "A child asked his father, \"How were people born?\" So his father said, Adam and Eve made babies, then their babies became adults anda made babies and so on.The child then went to his mother, asked her the same question and she told him, \"We were monkeys then we evolved to become like we are now.\" The child ran back to his father and said, \"You lied to me!\" His father replied, \"No, your mom was talking about her side of the family.(1)\"");
  Story story2 =  Story(2, "A child asked his father, \"How were people born?\" So his father said, Adam and Eve made babies, then their babies became adults anda made babies and so on.The child then went to his mother, asked her the same question and she told him, \"We were monkeys then we evolved to become like we are now.\" The child ran back to his father and said, \"You lied to me!\" His father replied, \"No, your mom was talking about her side of the family.(2)\"");
  Story story3 =  Story(3, "A child asked his father, \"How were people born?\" So his father said, Adam and Eve made babies, then their babies became adults anda made babies and so on.The child then went to his mother, asked her the same question and she told him, \"We were monkeys then we evolved to become like we are now.\" The child ran back to his father and said, \"You lied to me!\" His father replied, \"No, your mom was talking about her side of the family.(3)\"");
  Story story4 =  Story(4, "A child asked his father, \"How were people born?\" So his father said, Adam and Eve made babies, then their babies became adults anda made babies and so on.The child then went to his mother, asked her the same question and she told him, \"We were monkeys then we evolved to become like we are now.\" The child ran back to his father and said, \"You lied to me!\" His father replied, \"No, your mom was talking about her side of the family.(4)\"");
  
  _MyAppState(){
      storyList.add(story1);
      storyList.add(story2);
      storyList.add(story3);
      storyList.add(story4);
  }

  void _handleFunny(){
    final random = Random();
    final selectStory = storyList.removeAt(current);
    selectStory.isFunny += 1;
    storyReaded.add(selectStory);
    if(storyList.isNotEmpty){
      current = random.nextInt(storyList.length);
    } 
    setState(() {});
  }


  void _handleNotFunny(){
    final random = Random();
    final selectStory = storyList.removeAt(current);
    selectStory.isNotFunny += 1;
    storyReaded.add(selectStory);
    if(storyList.isNotEmpty){
      current = random.nextInt(storyList.length);
    } 
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    width: 50,
                    height: 50,
                    image: AssetImage('assets/images/logo.png'),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text("Handicrafted by", style: TextStyle(color: Color.fromARGB(89, 0, 0, 0))),
                          Padding(
                            padding: EdgeInsets.only(left: 40),
                            child: Text("Jim HLS"),
                          ),
                        ],
                      ),
                      Image(
                        width: 50,
                        height: 50,
                        image: AssetImage('assets/images/logo2.png'),
                      ),
                    ],
                  ),
                  
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 160,
              color: Colors.green,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("A joke a day keeps the doctor away",style: TextStyle(fontSize: 20, color: Colors.white),),
                  Text("If you joke wrong way, you teeth have to pay.(Serious)",style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
              child: Container(
                height: 330,
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(storyList.isNotEmpty ? storyList[current].paragraph : "That's all the jokes for today! Come back another day!",
                    style: const TextStyle(wordSpacing: 0.1,letterSpacing: 1,color: Color.fromARGB(167, 0, 0, 0)),
                    
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      SizedBox(
                        width: 143,
                      
                        child: ElevatedButton(onPressed: () => {
                          if(storyList.isNotEmpty) {
                            _handleFunny()
                          }
                        } , child: const Text("This is Funny!"),),
                      ),
                      // ignore: sort_child_properties_last
                      SizedBox(
                        width: 143,
                        child: ElevatedButton(onPressed: () => {
                          if(storyList.isNotEmpty) {
                            _handleNotFunny()
                            }
                          }, child: const Text("This is not Funny."), style: ElevatedButton.styleFrom(backgroundColor: Colors.green),),
                      ),
                    ],)
                  ],
                ),
            
              ),
            ),
            const Divider(
              color: Color.fromARGB(99, 12, 11, 11),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Text("This app is created as part of Hlsolutions program. The materials contaied on this website are provided for general infomation only and do not constitute any form of advice. HLS assumes no responsibility for the accuracy of the statements and accepts no liability for any loss or damage which may arise form reliance on the infomation contained on this site.", style: TextStyle(color:Color.fromARGB(106, 0, 0, 0), letterSpacing: 0.9,height: 1,fontSize: 11,wordSpacing: 0.2),textAlign: TextAlign.center,),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text("Copyright 2021 HLS"),
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}


