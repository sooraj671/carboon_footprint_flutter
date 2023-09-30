
import 'package:firebase_database/firebase_database.dart';

String uid = "";
double total = 0;
int count = 0;
double avg = 0;
void storeUserData(Map<String, dynamic> userData) {
  // Use the UID as a key to store data under that user
  FirebaseDatabase.instance
      .ref()
      .child('users')
      .child(uid)
      .set(userData);
}

Future<void> fetchAllTotalFields() async {
  final ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child('users').get();

  if (snapshot.exists) {
    // Extract 'total' field from each user's data
    final userDataMap = snapshot.value as Map<dynamic, dynamic>;
    userDataMap.forEach((key, userData) {
      if (userData != null &&
          userData['carbon_footprint'] != null &&
          userData['carbon_footprint']['total'] != null) {
        final totalValue = userData['carbon_footprint']['total'];
        total += totalValue;
        count++;



      }
    });
    avg = total/count;
  } else {
    print('No data available.');
  }
}
