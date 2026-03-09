import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Hero Section
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                color: Colors.red.shade100,
                height: screenHeight * .95,
                child: Column(
                  children: [

                    Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(top: 8, right: 18),
                        child: Icon(CupertinoIcons.exclamationmark_triangle, size: 32)
                    ),

                    Spacer(flex: 3,),

                    Column(
                      children: [
                        Image.asset("lib/assets/weather_icons/1.png", scale: 1.7,),

                        Text("88 °C", style: TextStyle(fontSize: 102, color: Colors.black)),

                        Text("Unknown Location", style: TextStyle(fontSize: 28, color: Colors.black)),

                        Text("Unknown Weather", style: TextStyle(fontSize: 18, color: Colors.black)),
                      ],
                    ),

                    Spacer(flex: 3,),

                    Column(
                      children: [
                        Icon(CupertinoIcons.arrow_down, size: 18,),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
                          child: Text("Scroll Down for More", style: TextStyle(fontSize: 9, color: Colors.black)),
                        ),
                      ],
                    ),

                    // Spacer(),

                  ],
                ),
              ),
            ),

            SliverList(delegate: SliverChildListDelegate([
              Container(
                padding: const EdgeInsets.all(20),
                child: const Text(
                  "Upcoming hour data",
                  style: TextStyle(fontSize: 22),
                ),
              ),

              Container(
                height: 300,
                color: Colors.blue.shade100,
              ),

              Container(
                height: 300,
                color: Colors.green.shade100,
              ),
            ],),)
          ],
        ),
      ),
    );
  }
}
