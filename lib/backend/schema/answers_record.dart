import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnswersRecord extends FirestoreRecord {
  AnswersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "quiz_id" field.
  DocumentReference? _quizId;
  DocumentReference? get quizId => _quizId;
  bool hasQuizId() => _quizId != null;

  // "question_id" field.
  DocumentReference? _questionId;
  DocumentReference? get questionId => _questionId;
  bool hasQuestionId() => _questionId != null;

  // "option_selected" field.
  String? _optionSelected;
  String get optionSelected => _optionSelected ?? '';
  bool hasOptionSelected() => _optionSelected != null;

  // "answered_correctly" field.
  bool? _answeredCorrectly;
  bool get answeredCorrectly => _answeredCorrectly ?? false;
  bool hasAnsweredCorrectly() => _answeredCorrectly != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _quizId = snapshotData['quiz_id'] as DocumentReference?;
    _questionId = snapshotData['question_id'] as DocumentReference?;
    _optionSelected = snapshotData['option_selected'] as String?;
    _answeredCorrectly = snapshotData['answered_correctly'] as bool?;
    _userId = snapshotData['user_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('answers');

  static Stream<AnswersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnswersRecord.fromSnapshot(s));

  static Future<AnswersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnswersRecord.fromSnapshot(s));

  static AnswersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnswersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnswersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnswersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnswersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnswersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnswersRecordData({
  DocumentReference? quizId,
  DocumentReference? questionId,
  String? optionSelected,
  bool? answeredCorrectly,
  DocumentReference? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'quiz_id': quizId,
      'question_id': questionId,
      'option_selected': optionSelected,
      'answered_correctly': answeredCorrectly,
      'user_id': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnswersRecordDocumentEquality implements Equality<AnswersRecord> {
  const AnswersRecordDocumentEquality();

  @override
  bool equals(AnswersRecord? e1, AnswersRecord? e2) {
    return e1?.quizId == e2?.quizId &&
        e1?.questionId == e2?.questionId &&
        e1?.optionSelected == e2?.optionSelected &&
        e1?.answeredCorrectly == e2?.answeredCorrectly &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(AnswersRecord? e) => const ListEquality().hash([
        e?.quizId,
        e?.questionId,
        e?.optionSelected,
        e?.answeredCorrectly,
        e?.userId
      ]);

  @override
  bool isValidKey(Object? o) => o is AnswersRecord;
}
