import 'package:flutter/material.dart';
import 'package:tes_app/models/profile.dart';
import 'package:tes_app/screens/dashboard_screen.dart';

import 'package:tes_app/services/api_service.dart';


final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class FormAddScreen extends StatefulWidget {
  Profile profile;

  FormAddScreen({this.profile});

  @override
  _FormAddScreenState createState() => _FormAddScreenState();
}

class _FormAddScreenState extends State<FormAddScreen> {
  bool _isLoading = false;
  ApiService _apiService = ApiService();
  bool _isFieldNameValid;
  bool _isFieldEmailValid;
  bool _isFieldAgeValid;
  bool _isFieldGenderValid;
  bool _isFieldNextOfKinValid;
  bool _isFieldKinNumberValid;
  bool _isFieldPreMessageValid;

  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerAge = TextEditingController();
  TextEditingController _controllerGender = TextEditingController();
  TextEditingController _controllerNextOfKin = TextEditingController();
  TextEditingController _controllerKinNumber = TextEditingController();
  TextEditingController _controllerPreMessage = TextEditingController();

  @override
  void initState() {
    if (widget.profile != null) {

      _isFieldNameValid = true;
      _controllerName.text = widget.profile.name;

      _isFieldEmailValid = true;
      _controllerEmail.text = widget.profile.email;

      _isFieldAgeValid = true;
      _controllerAge.text = widget.profile.age.toString();
      //
      _isFieldGenderValid = true;
      _controllerGender.text = widget.profile.gender;

      _isFieldNextOfKinValid = true;
      _controllerNextOfKin.text = widget.profile.nextOfKin;

      _isFieldKinNumberValid = true;
      _controllerKinNumber.text = widget.profile.kinNumber.toString();

      _isFieldPreMessageValid = true;
      _controllerPreMessage.text = widget.profile.preMessage;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.profile == null ? "Fill The Form" : "Change Data",
          style: TextStyle(color: Colors.white),
        ),
        ////////////////////////
      
      ),
      body: SingleChildScrollView(
              child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    _buildTextFieldName(),
                    _buildTextFieldEmail(),
                    _buildTextFieldAge(),
                    _buildTextFieldGender(),
                    _buildTextFieldNextOfKin(),
                    _buildTextFieldKinNumber(),
                    _buildTextFieldPreMessage(),
                    
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: RaisedButton(
                        child: Text(
                          widget.profile == null
                              ? "Submit".toUpperCase()
                              : "Update Data".toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          if (_isFieldNameValid == null ||
                              _isFieldEmailValid == null ||
                              _isFieldAgeValid == null ||

                              _isFieldGenderValid == null ||
                              _isFieldNextOfKinValid == null ||
                              _isFieldKinNumberValid == null ||
                              _isFieldPreMessageValid == null ||


                              !_isFieldNameValid ||
                              !_isFieldEmailValid ||
                              !_isFieldAgeValid ||

                              !_isFieldGenderValid ||
                              !_isFieldNextOfKinValid ||
                              !_isFieldKinNumberValid ||
                              !_isFieldPreMessageValid

                              )
                              
                          {
                            _scaffoldState.currentState.showSnackBar(
                              SnackBar(
                                content: Text("Please fill all field"),
                              ),
                            );
                            return;
                          }else // is this good programming?
                                Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                    builder: (context) => new Dashboard(),
                                  ),
                                );

                          setState(() => _isLoading = true);
                          String name = _controllerName.text.toString();
                          String email = _controllerEmail.text.toString();
                          int age = int.parse(_controllerAge.text.toString());
                          String gender = _controllerGender.text.toString();
                          String nextOfKin = _controllerNextOfKin.text.toString();
                          int kinNumber = int.parse(_controllerKinNumber.text.toString());
                          String preMessage = _controllerPreMessage.text.toString();
                          Profile profile =
                              Profile(name: name, email: email, age: age, gender: gender, nextOfKin: nextOfKin, kinNumber: kinNumber, preMessage: preMessage);
                          if (widget.profile == null) {
                            _apiService.createProfile(profile).then((isSuccess) {
                              print(isSuccess);
                              setState(() => _isLoading = false);
                              if (isSuccess) {
                                Navigator.pop(_scaffoldState.currentState.context);
                              } else {
                                _scaffoldState.currentState.showSnackBar(SnackBar(
                                  content: Text("Submit data failed"),
                                ));
                              }
                            }).catchError((error) {
                                 print(error);
                            });
                          } else {
                            profile.id = widget.profile.id;
                            _apiService.updateProfile(profile).then((isSuccess) {
                              setState(() => _isLoading = false);
                              if (isSuccess) {
                                Navigator.pop(_scaffoldState.currentState.context);
                              } else {
                                _scaffoldState.currentState.showSnackBar(SnackBar(
                                  content: Text("Update data failed"),
                                ));
                              }
                            });
                          }
                        },
                        color: Colors.orange[600],
                      ),
                      
                    )
                  ],
                ),
             
            ),
            
            _isLoading
                ? Stack(
                    children: <Widget>[
                      Opacity(
                        opacity: 0.3,
                        child: ModalBarrier(
                          dismissible: false,
                          color: Colors.grey,
                        ),
                      ),
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldName() {
    return TextField(
      controller: _controllerName,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Full name",
        errorText: _isFieldNameValid == null || _isFieldNameValid
            ? null
            : "Full name is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldNameValid) {
          setState(() => _isFieldNameValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldEmail() {
    return TextField(
      controller: _controllerEmail,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        errorText: _isFieldEmailValid == null || _isFieldEmailValid
            ? null
            : "Email is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldEmailValid) {
          setState(() => _isFieldEmailValid = isFieldValid);
        }
      },
    );
  }
  

  Widget _buildTextFieldAge() {
    return TextField(
      controller: _controllerAge,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Age",
        errorText: _isFieldAgeValid == null || _isFieldAgeValid
            ? null
            : "Age is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldAgeValid) {
          setState(() => _isFieldAgeValid = isFieldValid);
        }
      },
    );
  }
  Widget _buildTextFieldGender() {
    return TextField(
      controller: _controllerGender,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Gender",
        errorText: _isFieldGenderValid == null || _isFieldGenderValid
            ? null
            : "Gender is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldGenderValid) {
          setState(() => _isFieldGenderValid = isFieldValid);
        }
      },
    );
  }
  
  Widget _buildTextFieldNextOfKin() {
    return TextField(
      controller: _controllerNextOfKin,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Next Of Kin Name",
        errorText: _isFieldNextOfKinValid == null || _isFieldNextOfKinValid
            ? null
            : "Kin Name is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldNextOfKinValid) {
          setState(() => _isFieldNextOfKinValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldKinNumber() {
    return TextField(
      controller: _controllerKinNumber,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Next Of Kin Number",
        errorText: _isFieldKinNumberValid == null || _isFieldKinNumberValid
            ? null
            : "Number is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldKinNumberValid) {
          setState(() => _isFieldKinNumberValid = isFieldValid);
        }
      },
    );
  }

   Widget _buildTextFieldPreMessage() {
    return TextField(
      controller: _controllerPreMessage,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Write a short Message",
        errorText: _isFieldPreMessageValid == null || _isFieldPreMessageValid
            ? null
            : "This message will be sent to the Emergency Service",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldPreMessageValid) {
          setState(() => _isFieldPreMessageValid = isFieldValid);
        }
      },
    );
  }

}
