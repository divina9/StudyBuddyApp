import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SessionsRecord extends FirestoreRecord {
  SessionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Name" field.
  List<DocumentReference>? _name;
  List<DocumentReference> get name => _name ?? const [];
  bool hasName() => _name != null;

  // "Time" field.
  List<DateTime>? _time;
  List<DateTime> get time => _time ?? const [];
  bool hasTime() => _time != null;

  // "Location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "Publicprivate" field.
  String? _publicprivate;
  String get publicprivate => _publicprivate ?? '';
  bool hasPublicprivate() => _publicprivate != null;

  void _initializeFields() {
    _name = getDataList(snapshotData['Name']);
    _time = getDataList(snapshotData['Time']);
    _location = snapshotData['Location'] as String?;
    _publicprivate = snapshotData['Publicprivate'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Sessions');

  static Stream<SessionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SessionsRecord.fromSnapshot(s));

  static Future<SessionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SessionsRecord.fromSnapshot(s));

  static SessionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SessionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SessionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SessionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SessionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SessionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSessionsRecordData({
  String? location,
  String? publicprivate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Location': location,
      'Publicprivate': publicprivate,
    }.withoutNulls,
  );

  return firestoreData;
}
