import 'package:flutter/material.dart';

class Totalrecipes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:40, vertical: 20),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.greenAccent[100],
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Container(margin: EdgeInsets.all(12),child: Image(image: AssetImage("assets/book.png"))),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(margin:EdgeInsets.symmetric(horizontal: 12),child: Text("You have 0 recipes!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),)),
              SizedBox(height:5),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, "allrecipes"),
                child: Text("See all recipes", style: TextStyle(fontSize: 16))
              )
            ],
          )
        ],
      ),
    );
  }
}