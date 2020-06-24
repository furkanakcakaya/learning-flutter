import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() {
  runApp(MaterialApp(
    home: QuoteList()
  ));
}

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<Quote> quoteList = [
    Quote(quote: "There is not such a quote actually",author: "ax"),
    Quote(quote: "I think flutter is amazing.",author: "ax"),
    Quote(quote: "Don't really know what to say dude",author: "ax"),
    Quote(quote: "Shit wish I was high rn",author: "ax"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[500],
        title: Text('Awesome Quotes'),
        centerTitle: true,
      ),


      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: quoteList.map((qIns) => QuoteCard(
            quote: qIns,
            delete: (){
              setState(() {
                quoteList.remove(qIns);
              });
            }
        )).toList(),
      )
    );
  }
}



