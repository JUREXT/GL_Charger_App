import 'dart:io';
import 'services.dart';

class UserService extends Service {

  String currentUid() {
    return "1";
  }

  setUserStatus(bool isOnline) {
   // var user = firebaseAuth.currentUser;
    // if (user != null) {
    //   usersRef
    //       .doc(user.uid)
    //       .update({'isOnline': isOnline, 'lastSeen': Timestamp.now()});
    // }
  }

  updateProfile({File image, String username, String bio, String country}) async {
    // DocumentSnapshot doc = await usersRef.doc(currentUid()).get();
    // var users = UserModel.fromJson(doc.data());
    // users?.username = username;
    // users?.bio = bio;
    // users?.country = country;
    // if (image != null) {
    //   users?.photoUrl = await uploadImage(profilePic, image);
    // }
    // await usersRef.doc(currentUid()).update({
    //   'username': username,
    //   'bio': bio,
    //   'country': country,
    //   "photoUrl": users?.photoUrl ?? '',
    // });

    return true;
  }
}
