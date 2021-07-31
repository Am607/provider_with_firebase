import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myworks/Controller/workProvider.dart';
import 'package:myworks/Model/workModel.dart';
import 'package:provider/provider.dart';

//! pending work widget

class MyworkListWidget extends StatelessWidget {
  const MyworkListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<WorkProvider>(context);
    final workdata = data.works;

    return workdata.isEmpty
        //! condition
        ? Center(
            child: Text(
              'No pending works',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(10),
            separatorBuilder: (context, index) => Container(
              height: 10,
            ),
            itemCount: workdata.length,
            itemBuilder: (context, index) {
              final work = workdata[index];

              print(workdata[0].title);

              return WorkWidget(workModel: work);
            },
          );
  }
}
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

//! single work widget
class WorkWidget extends StatelessWidget {
  final WorkModel workModel;
  const WorkWidget({Key? key, required this.workModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(workModel.id);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),

      //! using external package for sliding : slidebar
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        key: Key(workModel.id),
        actions: [
          IconSlideAction(
            color: Colors.green,
            onTap: () {},
            caption: 'Edit',
            icon: Icons.edit,
          ),
        ],
        //<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
        secondaryActions: [
          IconSlideAction(
              color: Colors.red,
              onTap: () {},
              caption: 'Edit',
              icon: Icons.delete)
        ],

        //<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                value: workModel.isDone,
                onChanged: (_) {},
                activeColor: Theme.of(context).primaryColor,
                checkColor: Colors.white,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      workModel.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 22,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text(
                        workModel.description,
                        style: TextStyle(fontSize: 20, height: 1.5),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
