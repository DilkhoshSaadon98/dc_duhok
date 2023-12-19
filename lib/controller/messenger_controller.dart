import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessengerController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController messageController = TextEditingController();
  //! Variables :
  int unReadMessage = 0;
  String lastMessageText = '';
  bool? isMessageRead;
  String reciverName = '';

  //! Send Messages ;
  void sendMessage(String text, String reciver) {
    if (text.isNotEmpty) {
      firestore.collection('messages').add({
        'sender': myServices.sharedPreferences.getString('email'),
        'reciver': reciver,
        // 'users': [ myServices.sharedPreferences.getString('email'), reciver],
        'text': text,
        'timestamp': DateTime.now(),
        'read': false
        // Add a field for the sender's ID or name if needed
      });
    }
  }

  void countUnReadMessages() async {
    //* Sender  => fares
    //* reciver => dark
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('messages')
        .where('read', isEqualTo: false)
        .where('sender',
            isNotEqualTo: myServices.sharedPreferences.getString('email'))
        .get();
    unReadMessage = querySnapshot.docs.length;
    update();
  }

  getReciverDetails(String userId) async {
    final user = await firestore.collection('users').doc(userId).get();
    reciverName = user.data()!['First Name'];
    update();
  }

  void getLastMessage() async {
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('messages')
        .where('sender',
            isEqualTo: myServices.sharedPreferences.getString('email'))
        .orderBy('timestamp', descending: true)
        .limit(1)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      final lastMessage = querySnapshot.docs.first;
      lastMessageText = lastMessage['text'];
      isMessageRead = lastMessage['read'];
      update();
    }
  }

  void markMessagesAsRead() async {
    //* Sender  => fares
    //* reciver => dark
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('messages')
        .where('read', isEqualTo: false)
        .where('reciver', isEqualTo: 'dark4.knight9198@gmail.com')
        .get();
    unReadMessage = querySnapshot.docs.length;
    final List<DocumentSnapshot> unreadMessages = querySnapshot.docs;
    final WriteBatch batch = FirebaseFirestore.instance.batch();
    for (DocumentSnapshot message in unreadMessages) {
      batch.update(
        message.reference,
        {'read': true},
      );
    }

    await batch.commit();
  }

  @override
  void onInit() {
    countUnReadMessages();
    getLastMessage();
    getReciverDetails('fares.baqe@gmail.com');
    super.onInit();
  }
}
  // //! Delete Messages :
  // void deleteAllMessage() async {
  //   try {
  //     final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //         .collection('messages')
  //         .where('sender',
  //             isEqualTo: myServices.sharedPreferences.getString(
  //                 'email')) // Assuming you have a 'senderEmail' field in your messages
  //         .get();
  //     for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
  //       await documentSnapshot.reference.delete();
  //     }
  //     // ignore: empty_catches
  //   } catch (error) {}
  // }