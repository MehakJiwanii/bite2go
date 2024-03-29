import 'package:bite2go/Screens/Dummy.dart';
import 'package:bite2go/Screens/Login/Or.dart';
import 'package:bite2go/Screens/ResetPassword/PartnerReg/Partner_Login.dart';
import 'package:bite2go/constants/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Partner_Registration extends StatefulWidget {
  const Partner_Registration({super.key});

  @override
  State<Partner_Registration> createState() => _Partner_RegistrationState();
}

class _Partner_RegistrationState extends State<Partner_Registration> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  bool passToggle = true;
  bool isChecked = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Future<void> _SignUp() async {
  //   try {
  //     UserCredential userCredential =
  //         await _auth.createUserWithEmailAndPassword(
  //             email: emailController.text.trim(),
  //             password: passController.text);

  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => PartnerLogin(),
  //       ),
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       print('The password is too weak');
  //     } else if (e.code == 'email-already-in-use ') {
  //       print('the account already exists');
  //     }
  //   } catch (e) {
  //     print('Error during registration: $e');
  //   }
  // }

  SaveDataToFirestore(User currentUser) {
    FirebaseFirestore.instance.collection('Sellers').doc(currentUser.uid).set({
      'SellerUID': currentUser.uid,
      'SellerEmail': currentUser.email,
      'SellerName': nameController.text.trim(),
      //'SellerUrl'   : SellerImageUrl,
      "Phone": numberController.text.trim(),
      "status": 'approved',
      'earnings': 0.0,
      //'lat':positiom.Latitude
      //'lng': positiom.Longitude
    });
  }

  Future<void> AuthenticateSellerandSignUp() async {
    User? currentUser;
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passController.text.trim())
        .then((auth) {
      currentUser = auth.user;
    });
    if (currentUser != null) {
      SaveDataToFirestore(currentUser!);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Dummy(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CircleAvatar(),
              Center(
                child: Text(
                  'Sign Up\n As Restaurant',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 23,
                    color: MPrimaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0x3FD9D9D9),
                    prefixIcon: Icon(
                      Icons.person_2_outlined,
                      color: Colors.grey,
                    ),
                    hintText: 'Restaurant Name',
                    focusColor: Colors.grey,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0x3FD9D9D9),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.grey,
                    ),
                    hintText: 'Email',
                    focusColor: Colors.grey,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: numberController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0x3FD9D9D9),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.grey,
                    ),
                    hintText: 'Phone number',
                    focusColor: Colors.grey,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passController,
                obscureText: passToggle,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0x3FD9D9D9),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: Icon(
                          passToggle ? Icons.visibility_off : Icons.visibility),
                    ),
                    prefixIcon: Icon(
                      Icons.lock_open,
                      color: Colors.grey,
                    ),
                    hintText: 'Password',
                    focusColor: Colors.grey,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 15,
                      width: 15,
                      child: Checkbox(
                        activeColor: Color(0x3FD9D9D9),
                        checkColor: MPrimaryColor,
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                      ),
                    ),
                  ),
                  Text(
                    "   I agree to the",
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: Color(0xFF161616),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    " Terms & Conditions",
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: MPrimaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    " and",
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: Color(0xFF161616),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    " Privacy Policy",
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: MPrimaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                width: 350,
                height: 58,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    onPressed: AuthenticateSellerandSignUp,
                    child: Text(
                      'Sign Up',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Have An Account?"),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PartnerLogin(),
                          ));
                    },
                    child: Text(
                      ' Sign In',
                      style: GoogleFonts.montserrat(color: MPrimaryColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
