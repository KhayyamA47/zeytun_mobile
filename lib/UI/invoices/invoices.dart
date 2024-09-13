import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zeytun_app/UI/invoices/invoice_detail.dart';
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
      backgroundColor: Colors.white,
      appBar: detailAppBar(context, title: "Qaimələr"),
      body: invoices == null
          ? Center(child: CircularProgressIndicator(color: mainColor))
          : ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
              itemBuilder: (c, i) {
                final model=invoices!.data!.data![i].attributes;
                return InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => InvoiceDetail(model: model)));

                  },
                  child: Padding(
                      padding: const EdgeInsets.only(left: 18.0,top: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.file_open_rounded, color: mainColor),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(model!.operation!),
                                const SizedBox(height: 5),
                                Text(model.amount!),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_month,
                                      color:
                                      Color.fromARGB(255, 149, 148, 148),
                                      size: 20,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(model.date!.substring(0,16)),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
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
                );
              },
              itemCount: invoices!.data!.data!.length),
    );
  }
}
