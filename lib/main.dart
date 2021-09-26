import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
void main()
{
  runApp(MyCalculator());
}
 class MyCalculator extends StatelessWidget{
  @override
   Widget build(BuildContext context)
  {
    return MaterialApp(
     title:"",
     home: Calculater(),
    );
  }

 }
 class Calculater extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return _Calculator();
  }

 }
 class _Calculator extends State<Calculater>
 {
  String text="0";
  double numone =0;
  double numtwo=0;
  String result="0";
  String finalresult='0';
  String opr='';
  String propr='';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return Scaffold (
   appBar:null ,
   backgroundColor: Colors.black,
   body: Container(
    margin: EdgeInsets.only(bottom: 29),
    child: Column(
     mainAxisAlignment:MainAxisAlignment.end,

     children: <Widget>[

      Row(
       children: <Widget>[
        Expanded(child: Text(
         text,
         style: TextStyle(
          color: Colors.white,
         fontSize: 60,

         ),
         maxLines: 1,
         textAlign: TextAlign.right,
        ),)
       ],
      ),
      Row(
       mainAxisAlignment:MainAxisAlignment.spaceEvenly,
       children: <Widget>
       [

        button("AC", Color(0xffa7a7a7)),
        button("+/-", Color(0xffa7a7a7)),
        button("%", Color(0xffa7a7a7)),
        button("/", Color(0xfffa9528)),

       ],
      ),
      Row(
       mainAxisAlignment:MainAxisAlignment.spaceEvenly,
       children: <Widget>
       [

        button("7", Color(0xff333333)),
        button("8", Color(0xff333333)),
        button("9", Color(0xff333333)),
        button("X", Color(0xfffa9528)),

       ],
      ),
      Row(
       mainAxisAlignment:MainAxisAlignment.spaceEvenly,
       children: <Widget>
       [

        button("4", Color(0xff333333)),
        button("5", Color(0xff333333)),
        button("6", Color(0xff333333)),
        button("-", Color(0xfffa9528)),

       ],
      ),
      Row(
       mainAxisAlignment:MainAxisAlignment.spaceEvenly,
       children: <Widget>
       [

        button("1", Color(0xff333333)),
        button("2", Color(0xff333333)),
        button("3", Color(0xff333333)),
        button("+", Color(0xfffa9528)),

       ],
      ),
      Row(
       mainAxisAlignment:MainAxisAlignment.spaceEvenly,
       children: <Widget>
       [

        Container(
         padding: EdgeInsets.only(bottom: 10),
         child: RaisedButton(onPressed: (){
                  calculate("0");
         },
          child: Text("0",
           style: TextStyle(
            fontSize: 30,
           ),
          ),
          color: Color(0xff333333),
          padding: EdgeInsets.only(left: 81,top: 20,right: 81,bottom: 20),
          shape: StadiumBorder(),
         ),
        ),
        button(".", Color(0xff333333)),

        button("=", Color(0xfffa9528)),

       ],
      ),
     ],
    ),



   ),

  );
  }

  Widget button (String btn , Color color)
  {
   return Container(
    padding: EdgeInsets.only(bottom: 10),
    child: RaisedButton(onPressed: (){
      calculate(btn);
    },
     child: Text(btn,
      style: TextStyle(
       fontSize: 30,
      ),
     ),
     color: color,
     padding: EdgeInsets.all(23),
     shape: CircleBorder(),
    ),
   );

  }
  void calculate (String txtbtn) {
   if (txtbtn == "AC") {
    text = "0";
    numone = 0;
    numtwo = 0;
    result = "0";
    finalresult = '0';
    opr = '';
    propr = '';
   }
   /*  else if (txtbtn =="9"||txtbtn =="8"||txtbtn =="7"||txtbtn =="6"||txtbtn =="5"||txtbtn =="4"||txtbtn =="3"||txtbtn =="2"||txtbtn =="1"||txtbtn =="0")
       text=text+txtbtn;
       result=result+txtbtn;
  }*/
   else if (opr=="="&&txtbtn=="="){
    switch(propr)
    {
     case "+":
      finalresult=add();
      break;
     case "-":
      finalresult=sub();
      break;
     case "X":
      finalresult=mul();
      break;
     case "/":
      finalresult=div();
      break;

    }

   }
   else if (txtbtn == "+" || txtbtn == "-" || txtbtn == "X" || txtbtn == "/"||txtbtn=="=") {
    if (numone == 0) {
     numone = double.parse(result);
    }
    else {
     numtwo = double.parse(result);
    }

   switch (opr) {
    case "+":
     finalresult = add();
     break;
    case "-":
     finalresult = sub();
     break;
    case "X":
     finalresult = mul();
     break;
    case "/":
     finalresult = div();
     break;
   }
    propr=opr;
    opr=txtbtn;
    result='';

  }
   else if(txtbtn=='%')
   {
    result=(numone/100).toString();
    finalresult=result;
   }
   else if (txtbtn=="."){
    if(!result.contains("."))
     result+='.';
    finalresult =result;
   }
   else if (txtbtn=="+/-")
    {
     result.startsWith('-')?result=result.substring(1):result="-"+result;
     finalresult=result;
    }
   else{
    if(result=="0")
     {
      result=txtbtn;
     }
     else {
     result = result + txtbtn;
    }
     finalresult = result;

   }
   setState(() {
   text=finalresult;
   });
  }
String add()
   {
    result=(numone+numtwo).toString();
    numone=double.parse(result);
    return  decimalRemove(result);
   }
   String sub()
   {
    result=(numone-numtwo).toString();
    numone=double.parse(result);
    return  decimalRemove(result);
   }
   String mul()
   {
    result=(numone*numtwo).toString();
    numone=double.parse(result);
    return  decimalRemove(result);
   }
   String div()
   {
    result=(numone/numtwo).toString();
    numone=double.parse(result);
    return decimalRemove(result);
   }
   String decimalRemove(String _result)
   {
    if(_result.contains("."))
     {
      List<String> split =_result.split(".");
      if(!(int.parse(split[1])>0))
       return split[0];
     }
   }
}


