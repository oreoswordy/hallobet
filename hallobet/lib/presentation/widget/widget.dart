import 'package:flutter/material.dart';

Widget textFieldConsultation(String hint, TextEditingController controller){
  return TextField(        
    keyboardType: TextInputType.number,  
    controller: controller,     
    decoration: InputDecoration(
    hintText: hint,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),              
);
}

Widget cardInformation(BuildContext context, String image, String title, String desc){
  return Container(
              margin: EdgeInsets.all(12),
              child: Card(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(image),
                            ),
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 12),
                      Text(desc, textAlign: TextAlign.justify,),
                      ],
                  ),
                ),
              ),
            );           
}

AppBar appBarWidget(String title){
  return AppBar(
        backgroundColor: Color(0xff874CCC),
        centerTitle: true,
        title: Text(title, style: TextStyle(color: Colors.white),),
      );
}

Widget titleConsultation(String title){
  return Text(title, style: TextStyle(fontSize: 18));
}
Widget textfieldNumber(String title, TextEditingController controller){
  return Text(title, style: TextStyle(fontSize: 18));
}