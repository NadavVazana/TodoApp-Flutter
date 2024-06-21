import 'package:flutter/material.dart';

class EditDialog extends StatefulWidget {
  final String initValue;
  final Function(String? value)? onConfirm;
  final Function? onCancel;

  const EditDialog(
      {super.key, this.onCancel, this.onConfirm, this.initValue = ''});
  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  bool isInputUnvalid = false;
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller.text = widget.initValue;
  }

  void onConfirm() {
    if (_controller.text != '') {
      setState(() {
        isInputUnvalid = false;
      });
      widget.onConfirm?.call(_controller.text);
    } else {
      setState(() {
        isInputUnvalid = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Container(
            height: 200,
            color: Colors.white,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Edit your TODO',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  onChanged: (String? value) {
                    if (value != '') {
                      setState(() {
                        isInputUnvalid = false;
                      });
                    }
                  },
                  decoration: InputDecoration(
                      error:
                          isInputUnvalid ? const Text('Input is empty') : null),
                  controller: _controller,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orangeAccent),
                          onPressed: () {
                            onConfirm();
                          },
                          child: const Text(
                            'Confirm',
                            style: TextStyle(color: Colors.black),
                          )),
                      const SizedBox(width: 10),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey),
                          onPressed: () {
                            widget.onCancel?.call();
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
