import 'package:flutter/material.dart';
import 'package:nim_1801013026/theme.dart';

class KelilingKetupat extends StatefulWidget {

  @override
  _KelilingKetupatState createState() => _KelilingKetupatState();
}

class _KelilingKetupatState extends State<KelilingKetupat> {

  double result;
  double formula;
  TextEditingController sisiController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {

    handleResult(){
      if(sisiController.text.toString().isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                  'Form sisi belum terisi'
              ),
            )
        );
      }else{
        setState(() {
          double getNumber = double.parse(sisiController.text);
          result = 4 * getNumber;
        });
      }
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                      'assets/belah_ketupat.png',
                    width: 200,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rumus Keliling Belah Ketupat',
                    style: primaryTextStyle.copyWith(
                      fontSize: 25,
                      color: Colors.black
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: backgroundColor2
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20
                    ),
                    child:Text(
                      'K = 4 x S',
                      style: subtitleTextStyle.copyWith(
                        fontSize: 20,
                        color: Colors.white
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),

              Text(
                'Masukkan Sisi',
                style: primaryTextStyle.copyWith(
                    fontSize: 25,
                    color: Colors.black
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: backgroundColor2,
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20
                ),
                child: TextFormField(
                  style: primaryTextStyle,
                  controller: sisiController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Masukkan Panjang Sisi',
                    hintStyle: subtitleTextStyle.copyWith(
                        color: Colors.white
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Hasil',
                style: primaryTextStyle.copyWith(
                    fontSize: 25,
                    color: Colors.black
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: backgroundColor2,
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20
                ),
                child: Text(
                  result == null ? '0' : result.toStringAsFixed(2),
                  style: primaryTextStyle.copyWith(
                      fontSize: 20,
                      color: Colors.white
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: TextButton(
                  onPressed:  handleResult,
                  style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                      )
                  ),
                  child: Text(
                    'Hasil',
                    style: primaryTextStyle.copyWith(
                        fontSize: 20,
                        color: Colors.white
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
