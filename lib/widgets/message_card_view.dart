import 'package:flutter/material.dart';

class MessageCardView extends StatelessWidget {

  final PageController pageController;
  final List<Widget> cards;

  MessageCardView({this.pageController, this.cards});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        Container(
          height: 120.0,
          child: PageView.builder(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: cards.length,
            itemBuilder: (context, index) {
              return cards[index];
            },
          ),
        ),
        Positioned(
          right: 20.0,
          child: Container(
            height: 30.0,
            width: 30.0,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: IconButton(
              color: Colors.white,
              iconSize: 15.0,
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
              },
            ),
          ),
        ),
      ],
    );
  }
}