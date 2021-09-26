import 'package:flutter/material.dart';

class LocationAppBar extends StatelessWidget{
  final void Function(List<String> T) onSubmitted;
  
  const LocationAppBar({ Key? key, required this.onSubmitted}) : super(key: key);

  List<String> _inputParser (String input) {
    return input
      .trim()
      .split(RegExp(r'(/|,| )+ *', caseSensitive: false, unicode: true));
  }

  void _onSubmittedHandler(String input) {
    onSubmitted(_inputParser(input));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(20.0),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              splashColor: Colors.green,
              splashRadius: 20.0,
              icon: Icon(Icons.arrow_back),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: VerticalDivider(
                thickness: 1.0,
                width: 10.0,
                color: Colors.grey.shade600,
              ),
            ),
            Flexible(
              child: TextField (
                onSubmitted: _onSubmittedHandler,
                textInputAction: TextInputAction.search,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'City/State/Country or Zip Code',
                  hintStyle: TextStyle(
                    fontSize: 16.0,
                  ), 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}