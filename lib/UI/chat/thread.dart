import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeytun_app/controller/controller_listner.dart/storage_manegment.dart';
import '../../global/project_color.dart';
import '../../global/app_bar_detail.dart';
class ThreadView extends StatelessWidget {
  const ThreadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: detailAppBar(context, title: threadController.thread.name),
        body: Column(
          children: [
            const SizedBox(height: 10),
            Obx(
              () => Expanded(
                child:Column(
                children: [
                  (threadController.chatList.isEmpty)
                      ? Center(
                      heightFactor: MediaQuery.of(context).size.height*0.02,
                      child: CircularProgressIndicator(color: mainColor))
                      :
                  threadBox(threadController.chatList),
                 if(threadController.chatList.isEmpty)...[
                   const Spacer()
                 ],

                  //send message field fixed to the bottom of screen
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: threadController.messageController,
                            decoration: const InputDecoration(
                              hintText: "Mesaj yazın",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.attach_file_outlined),
                          onPressed: () {
                            photoController.picktureImage1();
                          },
                        ),
                        IconButton(
                          onPressed: () {
                            //send message to server
                            threadController.sendMessage().then((val){
                              //clear input field
                              threadController.messageController.clear();
                              //clear image
                              photoController.removeImage1();
                            });

                          },
                          icon: Icon(Icons.send),
                        ),


                      ],
                    ),
                  ),

                ],
                            ),
                          )
            )])
    );
  }
}

Expanded threadBox(list) {
  // check sender id if it is equal to user id, show it right side, else show left side.
  // Add avatar to left side
  // add input field to bottom of the page and send button, when send button clicked, add message to list and send to server
  return Expanded(
    child: ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //chat like whatsapp

                  if (threadController.user.value!=null && list[index].recipient == threadController.user.value!.id)
                    Column(
                      children:[
                        Text(
                          list[index].date,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                                          fit: BoxFit.cover)),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: mainColor,
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Text(
                                      list[index].body??'',
                                      style: TextStyle(color: Colors.white,),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        if (list[index].file!=null)
                          Image(image: NetworkImage(list[index].file),height: 150,),
                      ]
                    ),
                  if (threadController.user.value!=null && list[index].sender == threadController.user.value!.id)
                    Column(
                      children:[
                        Text(
                          list[index].date,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                list[index].body??'',
                                style: TextStyle(color: Colors.white,),
                              ),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                        if (list[index].file!=null)
                          Image(image: NetworkImage(list[index].file),height: 150,),
                      ]
                    ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}