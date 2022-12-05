import 'package:bill_split/results.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class BillSplit extends StatefulWidget {
  @override
  State<BillSplit> createState() => _BillSplitState();
}

class _BillSplitState extends State<BillSplit> {

  double friendsValue = 1.0;
  double tip = 0.0;
  String tax = '0';
  String bill = '0';
  int? newBill;


  buildButton(String text) {
    return Expanded(child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.all(25),
      ),
      onPressed: () {
        if (text == '-'){
          setState(() {
            bill = '';
          });
        }else{
          setState(() {
            newBill = int.parse(bill) + int.parse(text);
            bill = newBill.toString();
          });
        }
      },
      child: Text(text,style: kButtonStyle,),));
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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 70),
                child: Text('Share Price',
                style: GoogleFonts.montserrat(
                  fontSize: 30, fontWeight: FontWeight.w700),
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
                          Text('Total',
                          style: GoogleFonts.montserrat(
                              fontSize: 30, fontWeight: FontWeight.w700),),
                          Text(bill,
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
                              Text(friendsValue.round().toString(), style: kInfoStyle),
                              Text('$tax %', style: kInfoStyle),
                              Text('\$ ${tip.round().toString()}', style: kInfoStyle),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Text('How Many Friends',style: GoogleFonts.montserrat(
                  fontSize: 18, color: Colors.black, fontWeight: FontWeight.w700),
              ),
              Slider(
                min: 1, max: 15, value: friendsValue, divisions: 14,
                  activeColor: Colors.orange, inactiveColor: Colors.grey,

                  onChanged: (value) {
                  setState(() {
                    friendsValue = value;
                  });
                  }
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text('TIP', style: GoogleFonts.montserrat(
                            fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 40, height: 40,
                              child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    tip--;
                                  });
                                },
                                backgroundColor: Colors.grey,
                                child: Icon(Icons.remove, color: Colors.black,),
                              ),
                            ),
                            Text('\$ ${tip.round().toString()}', style: GoogleFonts.montserrat(
                                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),
                            ),
                            Container(
                              width: 40, height: 40,
                              child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    tip++;
                                  });
                                },
                                backgroundColor: Colors.grey,
                                child: Icon(Icons.add, color: Colors.black,),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value){
                          setState(() {
                            tax = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Tax in %',
                          labelStyle: GoogleFonts.montserrat(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  buildButton('1000'),
                  buildButton('500'),
                  buildButton('200'),
                ],
              ),
              Row(
                children: [
                  buildButton('50'),
                  buildButton('100'),
                  buildButton('-'),
                ],
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                child: Center(
                  child: Text('Split Bill',
                    style: kBottomButton,
                  ),
                ),
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context)=>ResultsPage(
                    bill, tax, friendsValue, tip))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
