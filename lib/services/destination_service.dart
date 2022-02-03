import 'package:airplane_booking/models/destination_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DestinationService {
  CollectionReference destinationCollection =
      FirebaseFirestore.instance.collection('destination');

  Future<List<DestinationModel>> getDestinations() async {
    try {
      QuerySnapshot result = await destinationCollection.get();
      List<DestinationModel> destinationList = result.docs.map(
        (doc) {
          return DestinationModel.fromJson(
              doc.id, doc.data() as Map<String, dynamic>);
        },
      ).toList();

      return destinationList;
    } catch (e) {
      throw e;
    }
  }
}
