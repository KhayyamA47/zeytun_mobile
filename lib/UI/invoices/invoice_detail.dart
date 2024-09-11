import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:zeytun_app/data/data_source/detail_data_source.dart';
import 'package:zeytun_app/data/model/invoices_model.dart';

class InvoiceDetail extends StatefulWidget {
  const InvoiceDetail({super.key, this.model});

  final Attributes? model;

  @override
  State<InvoiceDetail> createState() => _InvoiceDetailState();
}

class _InvoiceDetailState extends State<InvoiceDetail> {
  final dds = DetailDataSource();
  String? value;

  @override
  void initState() {
    super.initState();
    log(widget.model.toString());
    dds
        .getInvoiceDetail(widget.model!.operation!, widget.model!.type!,
            widget.model!.amount!, widget.model!.date!, widget.model!.gUID!)
        .then((v) {
      setState(() {
        value = v;
      });
      log("https://appzeytunpharm.az/files/gaimeler/$v");
    });
  }

  @override
  Widget build(BuildContext context) {
    return value == null
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            body: const PDF().cachedFromUrl(
            'https://appzeytunpharm.az/files/gaimeler/$value',
            errorWidget: (error) => Center(child: Text(error.toString())),
          ));
  }
}
