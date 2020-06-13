import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
final Function resetHandler;
  String get resultPhrase {
    String resultText;
    if (resultScore <= 8)
      resultText = "you are awesome and innocent";
    else if (resultScore <= 12)
      resultText = "you are averagely badass";
    else if (resultScore <= 18)
      resultText = "you are almost Strange";
    else
      resultText = "badaaasss!";
    return resultText;
  }

  Result(this.resultScore,this.resetHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: Column(
          children: [
            Text(
              resultPhrase,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text("score: ${resultScore}"),
            FlatButton(
              child: Text("Restart",style: TextStyle(color: Colors.blue),),
              onPressed:resetHandler ,
            )
          ],
        ));
  }
}
