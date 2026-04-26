import 'package:flutter/material.dart';
import 'package:islami_app/core/resourses/color-manger/color-manager.dart';

class CustumTextfieled extends StatelessWidget {
 CustumTextfieled({super.key, this.labelText, this.icon, this.imageIcon, this.onChange});
final String? labelText;
final Icon? icon;
final ImageIcon? imageIcon;
final onChange;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      style:  TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: ColorManager.offwhite,
      ),
      decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(

        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(

          color: ColorManager.primary_color,
          width: 2,
        )
      ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(

              color: ColorManager.primary_color,
              width: 2,
            )
        ),
        labelText:labelText,
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: ColorManager.offwhite,
        ),
        prefixIcon:imageIcon,
        prefixIconColor: ColorManager.primary_color,

      ),
    );
  }
}
