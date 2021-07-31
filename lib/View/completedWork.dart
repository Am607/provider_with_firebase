import 'package:flutter/material.dart';
import 'package:myworks/Controller/workProvider.dart';
import 'package:myworks/View/myworkListwidget.dart';
import 'package:provider/provider.dart';


//! work completed page

class CompletedWorkListwidget extends StatelessWidget {
  const CompletedWorkListwidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<WorkProvider>(context);
    final workdata = data.workCompleted;

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
