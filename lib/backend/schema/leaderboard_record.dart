import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeaderboardRecord extends FirestoreRecord {
  LeaderboardRecord._(
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

  // "score" field.
  int? _score;
  int get score => _score ?? 0;
  bool hasScore() => _score != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as DocumentReference?;
    _quizId = snapshotData['quiz_id'] as DocumentReference?;
    _score = castToType<int>(snapshotData['score']);
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('leaderboard');

  static Stream<LeaderboardRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LeaderboardRecord.fromSnapshot(s));

  static Future<LeaderboardRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LeaderboardRecord.fromSnapshot(s));

  static LeaderboardRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LeaderboardRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LeaderboardRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LeaderboardRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LeaderboardRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LeaderboardRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLeaderboardRecordData({
  DocumentReference? userId,
  DocumentReference? quizId,
  int? score,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'quiz_id': quizId,
      'score': score,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class LeaderboardRecordDocumentEquality implements Equality<LeaderboardRecord> {
  const LeaderboardRecordDocumentEquality();

  @override
  bool equals(LeaderboardRecord? e1, LeaderboardRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.quizId == e2?.quizId &&
        e1?.score == e2?.score &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(LeaderboardRecord? e) =>
      const ListEquality().hash([e?.userId, e?.quizId, e?.score, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is LeaderboardRecord;
}
