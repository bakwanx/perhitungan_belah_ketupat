import 'package:flutter/material.dart';

import '../theme.dart';

class InputForm extends StatefulWidget {

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {

  DateTime selectedDate = DateTime.now();
  String date; String name;
  String address;
  String age;
  String describe;

  TextEditingController nameController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();
  TextEditingController describeController = new TextEditingController();
  bool isSubmit = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2150)
    );

    if(picked != null && picked != selectedDate){
      setState(() {
        selectedDate = picked;
        date = selectedDate.day.toString() + '-' + selectedDate.month.toString() + '-' + selectedDate.year.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    date = selectedDate.day.toString() + '-' + selectedDate.month.toString() + '-' + selectedDate.year.toString();

    void snackBar(String message){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
                message
            ),
          )
      );
    }

    handleSubmit(){
      if(nameController.text.toString().isEmpty && addressController.text.toString().isEmpty && ageController.text.toString().isEmpty && describeController.text.toString().isEmpty){
        snackBar('Semua Form Belum Terisi');
        return;
      }
      if(nameController.text.toString().isEmpty){
        snackBar('Form Nama Belum Terisi');
        return;
      }
      if(addressController.text.toString().isEmpty){
        snackBar('Form Alamat Belum Terisi');
        return;
      }
      if(ageController.text.toString().isEmpty){
        snackBar('Form Usia Belum Terisi');
        return;
      }
      if(describeController.text.toString().isEmpty){
        snackBar('Form Keterangan Belum Terisi');
        return;
      }

      setState(() {
        name = nameController.text.toString();
        address = addressController.text.toString();
        age = ageController.text.toString();
        describe = describeController.text.toString();
        isSubmit = true;
      });
    }

    Widget _header(){
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin,
            left: defaultMargin,
            right: defaultMargin
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, User 1',
                    style: primaryTextStyle.copyWith(
                      fontSize:24,
                      fontWeight: semiBold,
                      color: Colors.black
                    ),
                  ),
                  Text(
                    '@1801013026',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacementNamed(context, '/signin');
              },
              child: Container(
                width: 35,
                height: 35,
                child: Image.asset(
                    iconLogOut
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget _emptyBody(){
      return Container(
        margin: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),

            Text(
              'Nama',
              style: primaryTextStyle.copyWith(
                  fontSize: 25,
                  color: Colors.black
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: backgroundColor2,
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20
              ),
              child:TextFormField(
                controller: nameController,
                style: primaryTextStyle,
                keyboardType: TextInputType.text,
                decoration: InputDecoration.collapsed(
                  hintText: 'Masukkan Nama',
                  hintStyle: subtitleTextStyle.copyWith(
                      color: Colors.white
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 15,
            ),

            Text(
              'Alamat',
              style: primaryTextStyle.copyWith(
                  fontSize: 25,
                  color: Colors.black
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: backgroundColor2,
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20
              ),
              child: TextFormField(
                controller: addressController,
                style: primaryTextStyle,
                keyboardType: TextInputType.text,
                maxLines: null,
                minLines: null,
                expands: true,
                decoration: InputDecoration.collapsed(
                  hintText: 'Masukkan Alamat',
                  hintStyle: subtitleTextStyle.copyWith(
                      color: Colors.white
                  ),

                ),
              ),
            ),

            SizedBox(
              height: 15,
            ),

            Text(
              'Tanggal Lahir',
              style: primaryTextStyle.copyWith(
                  fontSize: 25,
                  color: Colors.black
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: primaryColor,
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20
                  ),
                  child: GestureDetector(
                    onTap: (){
                      _selectDate(context);
                    },
                    child: Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  '${date}',
                  style: subtitleTextStyle.copyWith(
                    color: backgroundColor2,
                    fontSize: 20
                  ),
                )
              ],
            ),

            SizedBox(
              height: 15,
            ),

            Text(
              'Usia',
              style: primaryTextStyle.copyWith(
                  fontSize: 25,
                  color: Colors.black
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: backgroundColor2,
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20
              ),
              child: TextFormField(
                controller: ageController,
                style: primaryTextStyle,
                keyboardType: TextInputType.number,
                decoration: InputDecoration.collapsed(
                  hintText: 'Masukkan Usia',
                  hintStyle: subtitleTextStyle.copyWith(
                      color: Colors.white
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 15,
            ),

            Text(
              'Keterangan',
              style: primaryTextStyle.copyWith(
                  fontSize: 25,
                  color: Colors.black
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: backgroundColor2,
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20
              ),
              child: TextFormField(
                controller: describeController,
                style: primaryTextStyle,
                keyboardType: TextInputType.text,
                minLines: null,
                maxLines: null,
                expands: true,
                decoration: InputDecoration.collapsed(
                  hintText: 'Masukkan Keterangan',
                  hintStyle: subtitleTextStyle.copyWith(
                      color: Colors.white
                  ),
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
                onPressed: (){
                  setState(() {
                    handleSubmit();
                  });
                },
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
      );
    }

    Widget _body(){
      return Container(
        margin: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),

            Text(
              'Nama',
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
                name,
                style: primaryTextStyle,
              ),
            ),

            SizedBox(
              height: 15,
            ),

            Text(
              'Alamat',
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
                address,
                style: primaryTextStyle,
              ),
            ),

            SizedBox(
              height: 15,
            ),

            Text(
              'Tanggal Lahir',
              style: primaryTextStyle.copyWith(
                  fontSize: 25,
                  color: Colors.black
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: primaryColor,
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20
                  ),
                  child: Icon(
                    Icons.calendar_today,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  '${date}',
                  style: subtitleTextStyle.copyWith(
                      color: backgroundColor2,
                      fontSize: 20
                  ),
                )
              ],
            ),

            SizedBox(
              height: 15,
            ),

            Text(
              'Usia',
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
                age,
                style: primaryTextStyle,
              ),
            ),

            SizedBox(
              height: 15,
            ),

            Text(
              'Keterangan',
              style: primaryTextStyle.copyWith(
                  fontSize: 25,
                  color: Colors.black
              ),
            ),
            SizedBox(
              height: 5,
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
                describe,
                style: primaryTextStyle,
              ),
            ),

            SizedBox(
              height: 30,
            ),

            Container(
              height: 50,
              width: double.infinity,
              child: TextButton(
                onPressed: (){
                  setState(() {
                    isSubmit = false;
                  });
                },
                style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                    )
                ),
                child: Text(
                  'Masukkan Ulang',
                  style: primaryTextStyle.copyWith(
                      fontSize: 20,
                      color: Colors.white
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _header(),
              isSubmit == true ? _body() : _emptyBody()
            ],
          ),
        ),
      ),
    );
  }
}
