import 'package:zeytun_app/data/model/chat_model.dart';

class DataModel {
  List<Thread>? thread;
  List<MessageModel>? messages;

  DataModel({this.thread, this.messages});

  DataModel.fromJson(Map<String, dynamic> json) {
    if (json['thread'] != null) {
      thread = <Thread>[];
      json['thread'].forEach((v) {
        thread!.add(Thread.fromJson(v));
      });
    }
    if (json['messages'] != null) {
      messages = <MessageModel>[];
      json['messages'].forEach((v) {
        messages!.add(MessageModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (thread != null) {
      data['thread'] = thread!.map((v) => v.toJson()).toList();
    }
    if (messages != null) {
      data['messages'] = messages!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Data{thread: $thread, messages: $messages}';
  }
}