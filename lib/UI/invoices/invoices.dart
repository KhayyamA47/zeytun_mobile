import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zeytun_app/data/data_source/detail_data_source.dart';
import 'package:zeytun_app/data/model/invoices_model.dart';
import 'package:zeytun_app/global/app_bar_detail.dart';
import 'package:zeytun_app/global/project_color.dart';

class InvoicesView extends StatefulWidget {
  const InvoicesView({super.key});

  @override
  State<InvoicesView> createState() => _InvoicesViewState();
}

class _InvoicesViewState extends State<InvoicesView> {
  final dds = DetailDataSource();

  Invoices? invoices;

  @override
  void initState() {
    super.initState();
    dds.getInvoices().then((value) {

      setState(() {
        invoices = value;
        log("Value ::: ${invoices!.data!.data!.length.toString()}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: detailAppBar(context, title: "Qaimələr"),
      body: invoices == null
          ? Center(child: CircularProgressIndicator(color: mainColor))
          : ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
              itemBuilder: (c, i) {
                final model=invoices!.data!.data![i].attributes;
                return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.file_open_rounded, color: mainColor),
                        SizedBox(width: 10),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(model!.operation!),
                                    SizedBox(height: 5),
                                    Text(model.amount!),
                                    SizedBox(height: 5),
                                    Text(model.type!),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_month,
                                          color:
                                          Color.fromARGB(255, 149, 148, 148),
                                          size: 20,
                                        ),
                                        SizedBox(width: 4),
                                        Text(model.date!.substring(0,16)),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 20),
                                      width: double.infinity,
                                      height: 1,
                                      color: mainColor,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                );
              },
              itemCount: invoices!.data!.data!.length),
    );
  }
}
