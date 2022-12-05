import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsPage extends StatefulWidget {
  final String bill;
  final String tax;
  final double friends;
  final double tip;

  ResultsPage(this.bill, this.tax, this.friends, this.tip,);

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  String individualAmount = '';

  @override
  void initState() {
    super.initState();
    divideAmount();
  }

  divideAmount(){
    double taxed = double.parse(widget.bill) * (double.parse(widget.tax)) / 100;
    double finalBill = (double.parse(widget.bill) + taxed + widget.tip) / widget.friends;
    setState(() {
      individualAmount = finalBill.toStringAsFixed(2);
    });
  }

  TextStyle kInfoStyle = GoogleFonts.montserrat(
      fontSize: 18,color: Colors.black, fontWeight: FontWeight.w700);
  TextStyle kButtonStyle = GoogleFonts.montserrat(
      fontSize: 25,color: Colors.black, fontWeight: FontWeight.w700);
  TextStyle kBottomButton = GoogleFonts.montserrat(
      fontSize: 20, color: Colors.orange, fontWeight: FontWeight.w700);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[400],
      body: Container(
        margin: EdgeInsets.only(left: 20, right:20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 40),
              child: Text('Result', style: GoogleFonts.montserrat(
                  fontSize: 30, color: Colors.black, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.orange
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Individual Amount',
                          style: GoogleFonts.montserrat(
                              fontSize: 15, fontWeight: FontWeight.w700),),
                        Text('\$ $individualAmount',
                          style: GoogleFonts.montserrat(
                              fontSize: 30, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Friends', style: kInfoStyle),
                            Text('Tax', style: kInfoStyle),
                            Text('Tip', style: kInfoStyle),
                          ],
                        ),
                        SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.friends.round().toString(), style: kInfoStyle),
                            Text('${widget.tax} %', style: kInfoStyle),
                            Text('\$ ${widget.tip.round().toString()}', style: kInfoStyle),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Text('Partners pay $individualAmount each',
                style: GoogleFonts.montserrat(
                    fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700
                ),
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: ()=>Navigator.pop(context), child: Center(
                child: Text('Re-Calculate',style: kBottomButton),),),
            ),
          ],
        ),
      ),
    );
  }
}
