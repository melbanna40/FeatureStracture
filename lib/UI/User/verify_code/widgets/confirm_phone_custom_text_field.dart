import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmPhoneCustomTextField extends StatelessWidget {
  FocusNode focusNode;
  Function(String) onChange;

  ConfirmPhoneCustomTextField(this.focusNode, this.onChange, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Container(
        padding: const EdgeInsets.all(25),

        child: TextFormField(

          keyboardType: TextInputType.phone,
          maxLength: 1,
          onChanged: (text) {
            onChange.call(text);
          },
          decoration:  const InputDecoration(
            isDense: true,
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
            border: OutlineInputBorder(
              borderRadius:     BorderRadius.all( Radius.circular(25)),
              gapPadding: 25,
            ),
            counterText: '',
          ),
          autofocus: false,
          focusNode: focusNode,
          textInputAction: TextInputAction.next,
          style: const TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
