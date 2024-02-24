import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class FireStoreRepository {
  final firestore = FirebaseFirestore.instance;
  //Stream<DocumentSnapshot>? userStream;
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<UserModel> fetchUser(String userId) {
    return userCollection.doc(userId).get().then((snapShot) =>
        UserModel.fromJson(snapShot.data()! as Map<String, Object?>));
  }

  Future<bool> existAlready(String phoneNumber) async {
    bool existed = false;
    try {
      var doc = await userCollection.doc(phoneNumber).get();
      existed = doc.exists;
      return existed;
    } catch (e) {
      // If any error
      return false;
    }
  }

  Future<void> updateUserEmailStatus(String email, bool verified) async {
    userCollection
        .doc(email)
        .update({'isVerified': verified}).catchError((error) {
      throw (error);
    });
  }

  Future<bool> addUser(UserModel userModel) async {
    try {
      final userSnapshot =
          await userCollection.doc(userModel.phoneNumber).get();
      userModel.id = userSnapshot.id;
      if (!userSnapshot.exists) {
        userCollection.doc(userModel.phoneNumber).set(userModel.toJson());
        return true;
      }
      return false;
    } catch (e) {
      throw e;
    }
  }

  Future<DocumentSnapshot> getUserByEmail(String email) {
    print('simple $email');
    Future<DocumentSnapshot> snapshot = userCollection.doc(email).get();
    return snapshot;
  }

  // void addTodo(TodoModel todoModel) {
  //   String documentId = userCollection.doc().id;
  //   TodoModel newTodo = TodoModel(
  //       todoId: documentId,
  //       todoText: todoModel.todoText,
  //       email: todoModel.email);
  //   userCollection
  //       .doc(todoModel.email)
  //       .collection('todos')
  //       .doc(documentId)
  //       .set(newTodo.toJson());
  // }

  // Future<List<TodoModel>> fetchTodos(String email) async {
  //   var snapshot = await userCollection.doc(email).collection('todos').get();
  //   List<TodoModel> list = [];
  //   snapshot.docs.forEach((element) {
  //     list.add(TodoModel.fromJson(element.data()));
  //   });
  //
  //   if (list.isNotEmpty) {
  //     return list;
  //   } else {
  //     return [];
  //   }
  // }

  // void updateTodo(TodoModel updatedTodo) {
  //   userCollection
  //       .doc(updatedTodo.email)
  //       .collection('todos')
  //       .doc(updatedTodo.todoId)
  //       .update({'todoText': updatedTodo.todoText});
  // }

  // void deleteTodo(TodoModel todoModel) {
  //   userCollection
  //       .doc(todoModel.email)
  //       .collection('todos')
  //       .doc(todoModel.todoId)
  //       .delete();
  // }
}
