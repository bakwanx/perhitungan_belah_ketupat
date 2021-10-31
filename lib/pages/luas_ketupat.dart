import 'package:flutter/material.dart';

import '../theme.dart';

class LuasKetupat extends StatefulWidget {

  @override
  _LuasKetupatState createState() => _LuasKetupatState();
}

class _LuasKetupatState extends State<LuasKetupat> {

  double result;
  double formula;
  TextEditingController diagonalController = TextEditingController(text: '');
  TextEditingController diagonal2Controller = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {

    handleResult(){
      if(diagonalController.text.toString().isEmpty || diagonal2Controller.text.toString().isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                  'Form diagonal belum terisi'
              ),
            )
        );
      }else{
        setState(() {
          double diagonal1 = double.parse(diagonalController.text);
          double diagonal2 = double.parse(diagonal2Controller.text);
          result = 1/2 * diagonal1 * diagonal2;
        });
      }
    }

    return Container(
      child: SafeArea(
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
                      'Rumus Luas Belah Ketupat',
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
                        'L = ½ x d1 x d2',
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
                  'Masukkan Diagonal 1',
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
                    controller: diagonalController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Masukkan Diagonal 1',
                      hintStyle: subtitleTextStyle.copyWith(
                          color: Colors.white
                      ),
                    ),
                  )
                ),

                Text(
                  'Masukkan Diagonal 2',
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
                    controller: diagonal2Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Masukkan Diagonal 2',
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
      ),
    );
  }
}
