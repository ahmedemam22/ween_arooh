import 'package:flutter/material.dart';
import 'package:ween_arooh/widgets/text_field_shape.dart';
import 'package:ween_arooh/utils/validation.dart';
class CompanyInfoShape extends StatelessWidget {
  TextEditingController _controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            TextFieldShape(validate:fnValidName ,controller: _controller,hintName: "sss",),
            TextFieldShape(validate:fnValidName ,controller: _controller,hintName: "sss",),
            TextFieldShape(validate:fnValidName ,controller: _controller,hintName: "sss",),
            TextFieldShape(validate:fnValidName ,controller: _controller,hintName: "sss",),
            TextFieldShape(validate:fnValidName ,controller: _controller,hintName: "sss",),
          ],
        ),

      ),
    );
  }
  shape(){

  }
}
