import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Form Validation Sample',
      home: MyFormPage(),
    );
  }
}

class MyFormPage extends StatefulWidget {

  @override
  MyFormPageState createState() => MyFormPageState();

}

class MyFormPageState extends State<MyFormPage> {

  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Form Validation Sample"),
        ),
        body: FormBuilder(
          key: formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  FormBuilderTextField(
                    attribute: "name",
                    validators: [FormBuilderValidators.required()],
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: "Enter your name",
                        labelText: "Name"
                    ),
                  ),
                  SizedBox(height: 25),
                  FormBuilderTextField(
                    attribute: "email",
                    validators: [FormBuilderValidators.required(), FormBuilderValidators.email()],
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: "Enter your email",
                        labelText: "Email"
                    ),
                  ),
                  SizedBox(height: 25),
                  FormBuilderTextField(
                    attribute: "mobile",
                    validators: [FormBuilderValidators.required(), FormBuilderValidators.numeric()],
                    decoration: InputDecoration(
                        icon: Icon(Icons.phone),
                        hintText: "Enter your mobile no",
                        labelText: "Mobile No"
                    ),
                  ),
                  SizedBox(height: 25),
                  FormBuilderDateTimePicker(
                    attribute: "date",
                    inputType: InputType.date,
                    format: DateFormat("dd-MM-yyyy"),
                    decoration: InputDecoration(labelText: "Date of Birth"),
                    validators: [FormBuilderValidators.required()],
                  ),
                  SizedBox(height: 25),
                  FormBuilderTextField(
                    attribute: "age",
                    decoration: InputDecoration(labelText: "Age"),
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    validators: [
                      FormBuilderValidators.numeric(),
                      FormBuilderValidators.max(70),
                    ],
                  ),
                  SizedBox(height: 25),
                  FormBuilderRadioGroup(
                    attribute: "gender",
                    decoration: InputDecoration(
                      labelText: "Gender",
                      labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)
                    ),
                    options: [
                      FormBuilderFieldOption(value: "Male"),
                      FormBuilderFieldOption(value: "Female"),
                      FormBuilderFieldOption(value: "Custom"),
                    ],
                  ),
                  SizedBox(height: 25),
                  FormBuilderCheckboxList(
                    attribute: "languages",
                    initialValue: ["English"],
                    decoration: InputDecoration(
                        labelText: "Languages You Speak",
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)
                    ),
                    options: [
                      FormBuilderFieldOption(value: "English"),
                      FormBuilderFieldOption(value: "Spanish"),
                      FormBuilderFieldOption(value: "French"),
                    ],
                  ),
                  SizedBox(height: 25),
                  FormBuilderCountryPicker(
                    attribute: "country",
                    initialValue: "United States",
                    decoration: InputDecoration(
                        labelText: "Country",
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)
                    ),
                  ),
                  SizedBox(height: 25),
                  FormBuilderTextField(
                    attribute: "password",
                    decoration: InputDecoration(labelText: "Password"),
                    obscureText: true,
                    maxLines: 1,
                    maxLength: 16,
                    validators: [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(8),
                      FormBuilderValidators.maxLength(16)],
                  ),
                  SizedBox(height: 40),
                  RaisedButton(
                    child: Text("Submit"),
                    onPressed: (){
                      formKey.currentState.save();
                      if(formKey.currentState.validate()){
                        print(formKey.currentState.value);
                      }
                    },
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}
