// ignore_for_file: camel_case_types, must_be_immutable

import 'package:chat_app/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home_Screen extends StatelessWidget {
  Home_Screen({super.key});

  ControllerHome c = Get.put(ControllerHome());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<ControllerHome>(builder: (con) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return _buildMessage(con.message[index]);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox();
                },
                itemCount: con.message.length,
              );
            }),
          ),
          Container(
            color: Colors.grey.shade200,
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.73,
                    child: TextFormField(
                      onFieldSubmitted: (v) {
                        c.addMessage();
                      },
                      controller: c.messageController,
                      decoration: const InputDecoration(
                        hintText: "Enter Message",
                        labelText: 'Message',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GetBuilder<ControllerHome>(builder: (controller) {
                    return Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade300,
                        borderRadius: BorderRadius.circular(
                          40,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          controller.addMessage();
                        },
                        icon: controller.isEmpty.value == false
                            ? const Icon(Icons.settings_voice)
                            : const Icon(
                                Icons.send,
                                size: 20,
                              ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildMessage(String text) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                right: 10,
                left: 120,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(.7),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    )),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
