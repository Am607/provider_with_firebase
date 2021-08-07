import 'package:flutter/material.dart';
import 'package:myworks/Controller/workProvider.dart';
import 'package:myworks/Model/workModel.dart';
import 'package:provider/provider.dart';

// ! pop up screen code here

class TodoAddWidget extends StatefulWidget {
  const TodoAddWidget({Key? key}) : super(key: key);

  @override
  _TodoAddWidgetState createState() => _TodoAddWidgetState();
}

class _TodoAddWidgetState extends State<TodoAddWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,

          //<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

          children: [
            Text(
              'Addwork',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Addworkform(
              titleChange: (title) => setState(() => this.title = title),
              descriptionChange: (d) => setState(() => this.description = d),
              onSavedTodo: addwork,
            )
          ],
        ),
      ),
    );
  }

  void addwork() {
    final isValid = _formKey.currentState?.validate();
    if (isValid!) {
      
      final workModel = WorkModel(
        isDone: false,
          createdTime: DateTime.now(),
          title: title,
          description: description,
          id: DateTime.now().toString());


      final data = Provider.of<WorkProvider>(context, listen: false);

      data.addwork(workModel);
      Navigator.of(context).pop();
    } else {
      return;
    }
  }
}

//! form defind here
//! text is take trough a onchanged function without Textditing controller

class Addworkform extends StatelessWidget {
  final String? title;
  final String? description;
  final ValueChanged<String> titleChange;

  final ValueChanged<String> descriptionChange;
  final VoidCallback onSavedTodo;

  const Addworkform({
    this.title = '',
    this.description = '',
    required this.descriptionChange,
    required this.titleChange,
    required this.onSavedTodo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

    return Column(
      children: [
        TextFormField(
          maxLines: 1,
          initialValue: title,
          onChanged: titleChange,
          validator: (title) {
            if (title!.isEmpty) {
              return 'The title cannot be empty';
            }
            return null;
          },
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Title',
          ),
        ),
        TextFormField(
          maxLines: 3,
          initialValue: description,
          onChanged: descriptionChange,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Description',
          ),
        ),
        SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.orange),
            ),
            onPressed: onSavedTodo,
            child: Text('Save'),
          ),
        ),
      ],
    );
  }
}
