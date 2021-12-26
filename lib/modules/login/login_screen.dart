import 'package:firstflutter_project/shared/compenents/compenents.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  var passwordVisible = true;

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body:
      Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                        style: TextStyle(
                  fontSize: 40.0, fontWeight: FontWeight.bold,
                  ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultFormField(
                      type: TextInputType.emailAddress,
                      validate: (value)
                      {
                          if(value.isEmpty)
                            {
                              return 'the Email must not be empty';
                            }
                          return null;
                      },
                      label: 'Email',
                      prefix: Icons.email,
                      controller: emailController,
                      onChange: ()
                      {

                      },
                      onSubmit: ()
                      {

                      }, onTap: (){},


                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      label: 'Password',
                      isPassword: isPassword,
                      prefix: Icons.password_rounded,
                      suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                      validate: (value)
                      {
                        if(value.isEmpty)
                        {
                          return 'the Password must not be empty';
                        }
                        return null;
                      },
                      onChange: (){},
                      onSubmit: (){},
                      suffixPressed: ()
                      {
                            setState(()
                            {
                              isPassword = !isPassword;
                            });
                      }, onTap: (){},

                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text ( 'Login'),
                        onPressed: ()
                        {
                          if(formKey.currentState!.validate())
                          {
                            print(emailController.text);
                            print(passwordController.text);
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height:20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'If You Haven\'t an account ',
                      ),
                      TextButton(onPressed: (){}, child:
                      Text('Register Now'),)

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
