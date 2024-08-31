import 'package:flutter/material.dart';
import 'package:flutter_lab1_authen/controllers/auth_service.dart';
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
  final _formKey = GlobalKey<FormState>();
  final  _usernameController = TextEditingController();
  final  _passwordController = TextEditingController();
  final  _nameController = TextEditingController();
  final  _roleController = TextEditingController();

  // Variables for chip choices
 // List<String> _selectedChips = [];

 void _register() async{
  if(_formKey.currentState!.validate()){
    print('Username:${_usernameController.text}');
    print('Password:${_passwordController.text}');
    print('Name:${_nameController.text}');
    print('Role:${_roleController.text}');
  }
    try{
      final user = AuthService().register(_usernameController.text, _passwordController.text,_nameController.text,_roleController.text);
    }catch(e){
      print(e);
    }
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
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

              Text("Username"),
              SizedBox(height: 10),

              // RoundTextFields with validation
              RoundTextField(
                controller: _usernameController,
                labelText: 'username',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              Text("Password"),
              SizedBox(height: 10),

              // RoundTextFields with validation
              RoundTextField(
                controller: _passwordController,
                labelText: 'password',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),

              SizedBox(height: 10),
              Text("Name"),
              SizedBox(height: 10),
              RoundTextField(
                controller: _nameController,
                labelText: 'name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Text("Role"),
              SizedBox(height: 10),
              RoundTextField(
                controller: _roleController,
                labelText: 'role',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your role';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Chips
            /*  Text("Role"),
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
                  // Add more chips if needed
                ],
              ),*/
              SizedBox(height: 20),

              // Submit button
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // If the form is valid, proceed with the registration
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  }
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final String? Function(String?)? validator;

  const RoundTextField({
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      validator: validator,
    );
  }
}
