// {
// "id": 149318,
// "thread_id": 1213,
// "sender": 2,
// "recipient": 3812,
// "body": "asd asd",
// "link": null,
// "link_title": null,
// "is_read": 0,
// "is_thread": 2,
// "is_file": 0,
// "date": "2024-07-31 01:26:23",
// "status": 1,
// "delete": 0,
// "created_at": null,
// "updated_at": null,
// "file_id": null,
// "file": null
// }
import 'dart:developer';

class FileZytn{
  //{"id":332,"name":"scaled_IMG_20240801_192238.jpg","extension":"jpg","link":"https://appzeytunpharm.az/storage/messages/rg8a18v9lRCmZjzV1VPeff53QgwIAmXnNcqbCNsl.jpg","type":2,"category_id":null,"model_id":149400,"status":1,"delete":0,"created_at":null,"updated_at":null}
  int? id;
  String? name;
  String? extension;
  String? link;
  int? type;
  dynamic categoryId;
  int? modelId;
  int? status;
  int? delete;
  dynamic createdAt;
  dynamic updatedAt;

  FileZytn({this.id, this.name, this.extension, this.link, this.type, this.categoryId, this.modelId, this.status, this.delete, this.createdAt, this.updatedAt});

  FileZytn.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    extension = json['extension']?.toString();
    link = json['link']?.toString();
    type = json['type']?.toInt();
    categoryId = json['category_id'];
    modelId = json['model_id']?.toInt();
    status = json['status']?.toInt();
    delete = json['delete']?.toInt();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  Map<String,dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['extension'] = extension;
    data['link'] = link;
    data['type'] = type;
    data['category_id'] = categoryId;
    data['model_id'] = modelId;
    data['status'] = status;
    data['delete'] = delete;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
class MessageModel {
  int? id;
  int? threadId;
  int? sender;
  int? recipient;
  String? body;
  String? link;
  String? linkTitle;
  int? isRead;
  int? isThread;
  int? isFile;
  String? date;
  int? status;
  int? delete;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic fileId;
  String? file;

  MessageModel(
      {this.id,
      this.threadId,
      this.sender,
      this.recipient,
      this.body,
      this.link,
      this.linkTitle,
      this.isRead,
      this.isThread,
      this.isFile,
      this.date,
      this.status,
      this.delete,
      this.createdAt,
      this.updatedAt,
      this.fileId,
      this.file});

  MessageModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    threadId = json['thread_id']?.toInt();
    sender = json['sender']?.toInt();
    recipient = json['recipient']?.toInt();
    body = json['body']?.toString();
    link = json['link']?.toString();
    linkTitle = json['link_title']?.toString();
    isRead = json['is_read']?.toInt();
    isThread = json['is_thread']?.toInt();
    isFile = json['is_file']?.toInt();
    date = json['date']?.toString();
    status = json['status']?.toInt();
    delete = json['delete']?.toInt();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    fileId = json['file_id'];
    if (json['file'] != null && json['file']['link'] != null)
      file = json['file']['link']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['thread_id'] = threadId;
    data['sender'] = sender;
    data['recipient'] = recipient;
    data['body'] = body;
    data['link'] = link;
    data['link_title'] = linkTitle;
    data['is_read'] = isRead;
    data['is_thread'] = isThread;
    data['is_file'] = isFile;
    data['date'] = date;
    data['status'] = status;
    data['delete'] = delete;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['file_id'] = fileId;
    data['file'] = <String, dynamic>{};
    data['file']['link'] = file;
    return data;
  }

  @override
  String toString() {
    return 'MessageModel{id: $id, threadId: $threadId, sender: $sender, recipient: $recipient, body: $body, link: $link, linkTitle: $linkTitle, isRead: $isRead, isThread: $isThread, isFile: $isFile, date: $date, status: $status, delete: $delete, createdAt: $createdAt, updatedAt: $updatedAt, fileId: $fileId, file: $file}';
  }
}

// thread class has messages array and following
// "id": 1213,
// "name": "test shl",
// "status": 1,
// "delete": 0,
// "created_at": null,
// "updated_at": null,

class Thread{
  int? id;
  String? name;
  int? status;
  int? delete;
  dynamic createdAt;
  dynamic updatedAt;
  MessageModel message = MessageModel();


  Thread({this.id, this.name, this.status, this.delete, this.createdAt, this.updatedAt});

  Thread.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    status = json['status']?.toInt();
    delete = json['delete']?.toInt();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['delete'] = delete;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['message'] = message.toJson();
    return data;
  }

  @override
  String toString() {
    return 'Thread{id: $id, name: $name, status: $status, delete: $delete, createdAt: $createdAt, updatedAt: $updatedAt, message: $message}';
  }
}