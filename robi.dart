


import 'package:flutter/material.dart';

main(){
  runApp(page());



}
class page extends StatelessWidget {
  const page({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: login()
    );
  }
}

class login extends StatelessWidget {
   login({super.key});

  final formkey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,)),
        centerTitle: true,

      ),
      body:Padding(
    padding: const EdgeInsets.all(20.0),
     
      child: Column(
        
        children: [
          Image.asset('assets/images/robi.png',
            height: 90,
          ),

          Text('Log In',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),),
          SizedBox(height: 8),
          Text('Manage your SIM and unlock exclusive deals!'),
          SizedBox(height: 40),
          Align(
            alignment: Alignment.centerLeft,
            child:
            Text('Enter Robi number'),
          ),
          SizedBox(height: 10),

         Form(
           key: formkey,
           child:
           Column(children: [
         TextFormField(

           controller: phoneController,
           decoration: InputDecoration(
             hintText: '018XXXXXXXX',
             border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(14)
             ),
             prefixIcon: Icon(Icons.phone),
           ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Phone number is required';
      } else if (!RegExp(r'^(018|016)\d{8}$').hasMatch(value)) {
        return 'Please enter a valid Robi number';
      }
      return null;
    }),

  SizedBox(height: 16,),
                  ElevatedButton(
                    onPressed: () {
      if (formkey.currentState!.validate()) {

      // ✅ Valid number
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Number Validated!')),
      );
      } else {
      // ❌ Invalid input
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Invalid number!')),
      );
      }



                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 140, vertical: 15), // ভিতরের স্পেস
                      minimumSize: Size(200, 50), // মিনিমাম বাটনের প্রস্থ ও উচ্চতা
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(
                      'Send OTP',
                      style: TextStyle(fontSize: 18),

                    ),
                  ),
                  SizedBox(height: 25,),
                  Text('Or, login with'),
                  SizedBox(height: 40,),
                  Image.asset('assets/images/Google.png',
                  height: 50,
                  ),

           ]

          ),

         ),
        ],

      ),
    )
    );
  }
}
