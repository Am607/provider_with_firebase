import 'package:flutter/material.dart';
import 'package:myworks/Controller/workProvider.dart';
import 'package:myworks/Model/workModel.dart';
import 'package:myworks/View/TodoAddWidget.dart';
import 'package:provider/provider.dart';


//! update work page

class EditWorkPage extends StatefulWidget {
  final WorkModel workModel;
  const EditWorkPage({Key? key, required this.workModel}) : super(key: key);

  @override
  _EditWorkPageState createState() => _EditWorkPageState();
}

class _EditWorkPageState extends State<EditWorkPage> {
  final _formKey = GlobalKey<FormState>();

  late String title;
  late String description;

  @override
  void initState() {
    super.initState();

    title = widget.workModel.title;
    description = widget.workModel.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit work"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete,
            ),
            onPressed: () {
              final provider =
                  Provider.of<WorkProvider>(context, listen: false);
              provider.removeWork(widget.workModel);

              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: Addworkform(
              title: title,
              description: description,
              titleChange: (title) => setState(() => this.title = title),
              descriptionChange: (d) => setState(() => this.description = d),
              onSavedTodo: saveTodo,
            )),
      ),
    );
  }

//! function for update

  void saveTodo() {
    final isValid = _formKey.currentState?.validate();
    if (isValid!) {
      final provider = Provider.of<WorkProvider>(context, listen: false);

      provider.updateTodo(widget.workModel, title, description);

      Navigator.of(context).pop();
    } else {
      return;
    }
  }
}
