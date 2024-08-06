import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgressRecord extends FirestoreRecord {
  ProgressRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "quiz_id" field.
  DocumentReference? _quizId;
  DocumentReference? get quizId => _quizId;
  bool hasQuizId() => _quizId != null;

  // "progress" field.
  List<DocumentReference>? _progress;
  List<DocumentReference> get progress => _progress ?? const [];
  bool hasProgress() => _progress != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as DocumentReference?;
    _quizId = snapshotData['quiz_id'] as DocumentReference?;
    _progress = getDataList(snapshotData['progress']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('progress');

  static Stream<ProgressRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProgressRecord.fromSnapshot(s));

  static Future<ProgressRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProgressRecord.fromSnapshot(s));

  static ProgressRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProgressRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProgressRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProgressRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProgressRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProgressRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProgressRecordData({
  DocumentReference? userId,
  DocumentReference? quizId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'quiz_id': quizId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProgressRecordDocumentEquality implements Equality<ProgressRecord> {
  const ProgressRecordDocumentEquality();

  @override
  bool equals(ProgressRecord? e1, ProgressRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userId == e2?.userId &&
        e1?.quizId == e2?.quizId &&
        listEquality.equals(e1?.progress, e2?.progress);
  }

  @override
  int hash(ProgressRecord? e) =>
      const ListEquality().hash([e?.userId, e?.quizId, e?.progress]);

  @override
  bool isValidKey(Object? o) => o is ProgressRecord;
}
