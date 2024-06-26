import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/mycolors.dart';
import 'loginpage.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController passController = TextEditingController();

  var formkey = GlobalKey<FormState>();
  // formkey used to monitor the state of entire form and validate it

  var pwd_visibility=true;
  var pwd_visibilityc=true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
         child: Padding(
           padding: const EdgeInsets.all(28.0),
           child: Column(
             children: [
               const SizedBox(
                 height: 45,
               ),
               Text(
                   "Join Active eCommerce",
                   style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.red[800])
               ),
               Column(
                 //mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [

                   const SizedBox(
                     height: 35,
                   ),
                  Text("Name",style: TextStyle(color: Colors.red[900],fontWeight: FontWeight.bold),),
                   const TextField(
                     decoration: InputDecoration(
                       prefixIcon: Icon(Icons.person_outline_outlined),
                       border: OutlineInputBorder(),
                       labelText: "UserName",
                       hintText: 'Enter your Username here',
                     ),
                   ),
                   const SizedBox(
                     height: 15,
                   ),
                   Text("Email",style: TextStyle(color: Colors.red[900],fontWeight: FontWeight.bold),),
                   TextFormField(
                     validator:(email){
                       if(email!.isEmpty || !email.contains('@')){
                         return "email must be a valid email";
                       }else{
                         return null;
                       }
                     } ,
                     decoration: const InputDecoration(
                       prefixIcon: Icon(Icons.person_outline_outlined),
                       border: OutlineInputBorder(),
                       labelText: "Email",
                       hintText: 'Enter your email here',
                     ),
                   ),
                   const SizedBox(
                     height: 15,
                   ),
                   Text("Password",style: TextStyle(color: Colors.red[900],fontWeight: FontWeight.bold),),
                   TextFormField(
                     controller: passController,
                     obscureText:pwd_visibility ,
                     obscuringCharacter: '*',
                     validator: (password){
                       if(password!.isEmpty || password.length < 6) {
                         return 'Password is empty or / check the length';
                       }else{
                         return  null;
                       }
                     },
                     decoration: InputDecoration(
                       prefixIcon: Icon(Icons.password_outlined),
                       suffixIcon: IconButton(onPressed: (){
                         setState(() {
                           if(pwd_visibility==true){
                             pwd_visibility=false;
                           }else{
                             pwd_visibility=true;
                           }
                         });
                       }, icon: Icon(
                           pwd_visibility==true? Icons.visibility_off : Icons.visibility
                       )),
                       border: OutlineInputBorder(),
                       labelText: "Password",
                       hintText: 'Enter your password here',
                       helperText:
                       'Password must be at least 6 characters',
                     ),
                   ),
                   const SizedBox(
                     height: 15,
                   ),
                   Text("Retype Password",style: TextStyle(color: Colors.red[900],fontWeight: FontWeight.bold),),
                   TextFormField(
                     validator: (confirmpassword){
                       if(confirmpassword!.isEmpty || confirmpassword != passController.text){
                         return "password empty/mismatch";
                       }else{
                         return null;
                       }
                     },
                     obscureText:pwd_visibilityc ,
                     obscuringCharacter: '*',
                     decoration: InputDecoration(
                       prefixIcon: Icon(Icons.password_outlined),
                       suffixIcon: IconButton(onPressed: (){
                         setState(() {
                           if(pwd_visibilityc==true){
                             pwd_visibilityc=false;
                           }else{
                             pwd_visibilityc=true;
                           }
                         });
                       }, icon: Icon(
                           pwd_visibilityc==true? Icons.visibility_off : Icons.visibility
                       )),
                       border: OutlineInputBorder(),
                       labelText: "Confirm Password",
                       hintText: 'Confirm your password here',

                     ),
                   ),
                   const SizedBox(
                     height: 15,
                   ),

                 ],
               ),
               MaterialButton(
                 onPressed: () {
                   var valid = formkey.currentState!.validate();
                   if(valid == true){
                     Navigator.push(context, MaterialPageRoute(
                         builder: (context)=>LoginPage()));
                   }else{
                     ScaffoldMessenger.of(context).showSnackBar(
                         const SnackBar(content: Text("Registration failed")));
                   }
                 },
                 color: MyColors.basicColor,
                 minWidth: 300,
                 shape: const StadiumBorder(),
                 child: const Text("Sign up",style: TextStyle(color: Colors.white),),
               ),
               const SizedBox(height: 15),
               Text("Already have an account?"),
               const SizedBox(height: 15),
               MaterialButton(
                 onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                 },
                 color: MyColors.basicColor,
                 minWidth: 300,
                 shape: const StadiumBorder(),
                 child: Text("Log in", style: GoogleFonts.sahitya(
                     fontSize: 20,
                     fontWeight:FontWeight.bold,
                     color: Colors.white),),),
             ],
           ),
         ),
       ),
    );
  }
}
