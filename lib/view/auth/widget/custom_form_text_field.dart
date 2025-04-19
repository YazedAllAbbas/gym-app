import 'package:final_project/core/const_data/app_colors.dart';
import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField(
      {super.key, 
        this.fontFamily = "Poppins",
        //this.onChanged,
      this.hintText,
      this.myController,
     this.myValid,
    
      this.obscureText = false,
       this.keyboardType = TextInputType.text,});
      String fontFamily;
  Function(String)? onChanged;
  String? hintText;
 TextEditingController? myController;
 String? Function(String?)? myValid;
  bool? obscureText;
  TextInputType keyboardType; 
  
  @override
  // Widget build(BuildContext context) {
  //   return TextFormField(
      
  //     obscureText: obscureText!,
  //     controller: myController,
  //  validator: myValid,
  //     onChanged: onChanged,
  //     style: const TextStyle(
  //       color: Colors.black,
  //     ),
  //     textAlign: TextAlign.right, 
  //     decoration: InputDecoration(
  //         hintText: hintText,
          
  //         hintStyle:  TextStyle(
  //           fontFamily: fontFamily,
  //           color: Colors.black,
  //         ),
  //         enabledBorder: InputBorder.none,
  //         focusedBorder: InputBorder.none,
  //         // enabledBorder: OutlineInputBorder(
  //         //   borderRadius: BorderRadius.circular(20.0), 
  //         //   borderSide: const BorderSide(
  //         //     color: Colors.grey,
  //         //   ),
  //         // ),
  //       //   focusedBorder: OutlineInputBorder(
  //       //   borderRadius: BorderRadius.circular(20.0), // الحواف عند التركيز
  //       //   borderSide: const BorderSide(
  //       //     color: Colors.grey, // لون الحافة عند التركيز
  //       //   ),
  //       // ),
  //         // border:  OutlineInputBorder(
  //         //   borderRadius: BorderRadius.circular(20.0), 
  //         //   borderSide: BorderSide(
  //         //     color: Colors.grey,
  //         //   ),
  //         // )
  //         ),
  //   );
  // }
    Widget build(BuildContext context) {
    return Container(
    //  margin: margin,
      decoration: BoxDecoration(
          color: AppColor.lightgrey, borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        controller: myController,
        validator: myValid,
           onChanged: onChanged,
           keyboardType: keyboardType,
        //keyboardType: keyboardType,
        obscureText: obscureText!,
        textAlign: TextAlign.left, 
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: hintText,
          //  suffixIcon: rigtIcon,
            // prefixIcon: Container(
            //     alignment: Alignment.center,
            //     width: 20,
            //     height: 20,
            //     child: Image.asset(
            //      icon,
            //       width: 20,
            //       height: 20,
            //   //    fit: BoxFit.contain,
            //       color: Colors.grey,
            //     )),
            hintStyle: TextStyle(color: AppColor.grey, fontSize: 12, fontFamily: fontFamily,)),
            
      ),
    );
  }
}