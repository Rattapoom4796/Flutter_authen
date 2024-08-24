import 'package:flutter/material.dart';
import 'package:flutter_lab1_authen/login.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Register'),
        ),
        body: RegisterForm(),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  // Controllers for text fields
  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


 

  // Variables for chip choices
  List<String> _selectedChips = [];





  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // CircleAvatar
            CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Register",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            Text("Name"),
            SizedBox(height: 10),

            // RoundTextFields
            RoundTextField(
              controller: _firstnameController,
              labelText: 'FirstName',
            ),
             SizedBox(height: 20),

            Text("Lastname"),
            SizedBox(height: 10),

            // RoundTextFields
            RoundTextField(
              controller: _lastnameController,
              labelText: 'LastName',
            ),

            SizedBox(height: 10),
            Text("Username"),
            SizedBox(height: 10),
            RoundTextField(
              controller: _usernameController,
              labelText: 'Username',
            ),
            SizedBox(height: 10),
            Text("Password"),
            SizedBox(height: 10),
            RoundTextField(
              controller: _passwordController,
              labelText: 'Password',
              obscureText: true,
            ),
            SizedBox(height: 20),

            // Sliders
           /* Slider(
              value: _weight,
              min: 0,
              max: 100,
              divisions: 100,
              label: 'Weight: $_weight kg',
              onChanged: (value) {
                setState(() {
                  _weight = value;
                });
              },
            ),
            Slider(
              value: _height,
              min: 100,
              max: 200,
              divisions: 100,
              label: 'Height: $_height cm',
              onChanged: (value) {
                setState(() {
                  _height = value;
                });
              },
            ),
            SizedBox(height: 20),*/

            // Chips
            SizedBox(height: 5),

            Text("Role"),
            SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              children: [
                ChoiceChip(
                  label: Text('Admin'),
                  selected: _selectedChips.contains('Admin'),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selectedChips.add('Admin');
                      } else {
                        _selectedChips.remove('Admin');
                      }
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('User'),
                  selected: _selectedChips.contains('User'),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selectedChips.add('User');
                      } else {
                        _selectedChips.remove('User');
                      }
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),

                        // Submit button
             SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()),);
                
              },
              child: Text('register'),
            ),
          ],
        ),
      ),
    );
  }


}

class RoundTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;

  const RoundTextField({
    required this.controller,
    required this.labelText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
