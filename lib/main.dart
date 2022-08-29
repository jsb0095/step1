import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final _formKey = GlobalKey<FormState>();

String name = "";
String email = "";
String pw = "";
String pwCheck = "";
String nickName = "";
String address1 = "";
String address2 = "";
String address3 = "";

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("회원가입"),
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  renderTextFromField(
                    label: '이름',
                    onSaved: (val) {
                      setState(() {
                        name = val;
                      });
                    },
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        Text("필수필드입니다 ");
                      }
                    },
                  ),
                  renderTextFromField(
                    label: '이메일',
                    onSaved: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        Text("필수필드입니다 ");
                      }
                    },
                  ),
                  renderTextFromField(
                    label: '비밀번호',
                    onSaved: (val) {
                      setState(() {
                        pw = val;
                      });
                    },
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        Text("필수필드입니다 ");
                      }
                    },
                  ),
                  renderTextFromField(
                    label: '비밀번호 확인',
                    onSaved: (val) {
                      pwCheck = val;
                    },
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        Text("필수필드입니다 ");
                      }
                    },
                  ),
                  renderTextFromField(
                    label: '닉넥임',
                    onSaved: (val) {
                      setState(() {
                        nickName = val;
                      });
                    },
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        Text("필수필드입니다 ");
                      }
                    },
                  ),
                  renderTextFromField(
                    label: '주소1',
                    onSaved: (val) {
                      address1 = val;
                    },
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        Text("필수필드입니다 ");
                      }
                    },
                  ),
                  renderTextFromField(
                    label: '주소2',
                    onSaved: (val) {
                      address2 = val;
                    },
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        Text("필수필드입니다 ");
                      }
                    },
                  ),
                  renderTextFromField(
                    label: '주소3',
                    onSaved: (val) {
                      address3 = val;
                    },
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        Text("필수필드입니다 ");
                      }
                    },
                  ),
                  renderSubmitButton(),
                ],
              ),
            ),
          )),
    );
  }
}

renderStates() {
  return Column(
    children: [
      Text('name:${name}'),
      Text('email:${email}'),
      Text('pw:${pw}'),
      Text('pwCheck:${pwCheck}'),
      Text('address1:${address1}'),
      Text('address2:${address2}'),
      Text('address3:${address3}'),
      Text('nickName:${nickName}'),
    ],
  );
}

renderSubmitButton() {
  return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState?.save();
          Text("저장완료");
        }
      },
      child: Text("저장하기"));
}

renderTextFromField(
    {required String label,
    required FormFieldSetter onSaved,
    required FormFieldValidator validator}) {
  assert(label != null);
  assert(onSaved != null);
  assert(validator != null);
  return Column(
    children: [
      Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
      TextFormField(
        onSaved: onSaved,
        validator: validator,
      ),
      Container(
        height: 16.0,
      )
    ],
  );
}
