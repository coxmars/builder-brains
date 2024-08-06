import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionsRecord extends FirestoreRecord {
  QuestionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "parent_quiz" field.
  DocumentReference? _parentQuiz;
  DocumentReference? get parentQuiz => _parentQuiz;
  bool hasParentQuiz() => _parentQuiz != null;

  // "title_question" field.
  String? _titleQuestion;
  String get titleQuestion => _titleQuestion ?? '';
  bool hasTitleQuestion() => _titleQuestion != null;

  // "options" field.
  List<String>? _options;
  List<String> get options => _options ?? const [];
  bool hasOptions() => _options != null;

  // "correct_option" field.
  String? _correctOption;
  String get correctOption => _correctOption ?? '';
  bool hasCorrectOption() => _correctOption != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "users_responded" field.
  List<DocumentReference>? _usersResponded;
  List<DocumentReference> get usersResponded => _usersResponded ?? const [];
  bool hasUsersResponded() => _usersResponded != null;

  void _initializeFields() {
    _parentQuiz = snapshotData['parent_quiz'] as DocumentReference?;
    _titleQuestion = snapshotData['title_question'] as String?;
    _options = getDataList(snapshotData['options']);
    _correctOption = snapshotData['correct_option'] as String?;
    _order = castToType<int>(snapshotData['order']);
    _usersResponded = getDataList(snapshotData['users_responded']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('questions');

  static Stream<QuestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionsRecord.fromSnapshot(s));

  static Future<QuestionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionsRecord.fromSnapshot(s));

  static QuestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionsRecordData({
  DocumentReference? parentQuiz,
  String? titleQuestion,
  String? correctOption,
  int? order,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'parent_quiz': parentQuiz,
      'title_question': titleQuestion,
      'correct_option': correctOption,
      'order': order,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestionsRecordDocumentEquality implements Equality<QuestionsRecord> {
  const QuestionsRecordDocumentEquality();

  @override
  bool equals(QuestionsRecord? e1, QuestionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.parentQuiz == e2?.parentQuiz &&
        e1?.titleQuestion == e2?.titleQuestion &&
        listEquality.equals(e1?.options, e2?.options) &&
        e1?.correctOption == e2?.correctOption &&
        e1?.order == e2?.order &&
        listEquality.equals(e1?.usersResponded, e2?.usersResponded);
  }

  @override
  int hash(QuestionsRecord? e) => const ListEquality().hash([
        e?.parentQuiz,
        e?.titleQuestion,
        e?.options,
        e?.correctOption,
        e?.order,
        e?.usersResponded
      ]);

  @override
  bool isValidKey(Object? o) => o is QuestionsRecord;
}
