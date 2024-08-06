import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizRecord extends FirestoreRecord {
  QuizRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "numbers_of_questions" field.
  int? _numbersOfQuestions;
  int get numbersOfQuestions => _numbersOfQuestions ?? 0;
  bool hasNumbersOfQuestions() => _numbersOfQuestions != null;

  // "category" field.
  DocumentReference? _category;
  DocumentReference? get category => _category;
  bool hasCategory() => _category != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _numbersOfQuestions = castToType<int>(snapshotData['numbers_of_questions']);
    _category = snapshotData['category'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quiz');

  static Stream<QuizRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizRecord.fromSnapshot(s));

  static Future<QuizRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizRecord.fromSnapshot(s));

  static QuizRecord fromSnapshot(DocumentSnapshot snapshot) => QuizRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizRecordData({
  String? title,
  String? description,
  DateTime? createdAt,
  DateTime? updatedAt,
  int? numbersOfQuestions,
  DocumentReference? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'numbers_of_questions': numbersOfQuestions,
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizRecordDocumentEquality implements Equality<QuizRecord> {
  const QuizRecordDocumentEquality();

  @override
  bool equals(QuizRecord? e1, QuizRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.numbersOfQuestions == e2?.numbersOfQuestions &&
        e1?.category == e2?.category;
  }

  @override
  int hash(QuizRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.createdAt,
        e?.updatedAt,
        e?.numbersOfQuestions,
        e?.category
      ]);

  @override
  bool isValidKey(Object? o) => o is QuizRecord;
}
