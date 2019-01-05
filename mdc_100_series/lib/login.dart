// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TODO: Add text editing controllers (101), TextEditingController: A controller for an editable text field.
  final _usernameController = TextEditingController(
    text: '向彪',
  );
  final _passwordController = TextEditingController(
    text: '123456',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //SafeArea : A widget that insets its child by sufficient padding to avoid intrusions by the operating system.
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                SizedBox(height: 16.0),
                Text('SHRINE'),
              ],
            ),
            SizedBox(height: 120.0),
            // TODO: Wrap Username with AccentColorOverride (103)
            // TODO: Remove filled: true values (103)
            // TODO: Wrap Password with AccentColorOverride (103)

            // TODO: Add TextField widgets (101) 添加两个文本框，用于用户输入用户名和密码
            AccentColorOverride(
              color: kShrineBrown900,
              //TextField : A text field lets the user enter text, either with hardware keyboard or with an onscreen keyboard.
              child: TextField(
                decoration: InputDecoration(
//                filled: true,
                    labelText: 'UserName'
                ),
                controller: _usernameController,
              ),
            ),
            //spacer 间隔12.0
            SizedBox(height: 12.0),
            AccentColorOverride(
              color: kShrineBrown900,
              child: TextField(
                decoration: InputDecoration(
//                filled: true,
                    labelText: 'Password'
                ),
                obscureText: true,
                controller: _passwordController,
              ),
            ),

            // TODO: Add button bar (101) ButtonBar 把子项排列为一行。
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: (){
//                  // TODO: Clear the text fields (101)
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                // TODO: Show the next page (101)
                RaisedButton(
                  child: Text('Next'),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}

class AccentColorOverride extends StatelessWidget{
  final Color color;
  final Widget child;

  const AccentColorOverride({Key key, this.color, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(accentColor: color),
    );
  }
}
