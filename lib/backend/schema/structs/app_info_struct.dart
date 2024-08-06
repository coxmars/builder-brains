// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AppInfoStruct extends FFFirebaseStruct {
  AppInfoStruct({
    String? appVersion,
    String? bundleVersion,
    String? model,
    String? platform,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _appVersion = appVersion,
        _bundleVersion = bundleVersion,
        _model = model,
        _platform = platform,
        super(firestoreUtilData);

  // "app_version" field.
  String? _appVersion;
  String get appVersion => _appVersion ?? '';
  set appVersion(String? val) => _appVersion = val;

  bool hasAppVersion() => _appVersion != null;

  // "bundle_version" field.
  String? _bundleVersion;
  String get bundleVersion => _bundleVersion ?? '';
  set bundleVersion(String? val) => _bundleVersion = val;

  bool hasBundleVersion() => _bundleVersion != null;

  // "model" field.
  String? _model;
  String get model => _model ?? '';
  set model(String? val) => _model = val;

  bool hasModel() => _model != null;

  // "platform" field.
  String? _platform;
  String get platform => _platform ?? '';
  set platform(String? val) => _platform = val;

  bool hasPlatform() => _platform != null;

  static AppInfoStruct fromMap(Map<String, dynamic> data) => AppInfoStruct(
        appVersion: data['app_version'] as String?,
        bundleVersion: data['bundle_version'] as String?,
        model: data['model'] as String?,
        platform: data['platform'] as String?,
      );

  static AppInfoStruct? maybeFromMap(dynamic data) =>
      data is Map ? AppInfoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'app_version': _appVersion,
        'bundle_version': _bundleVersion,
        'model': _model,
        'platform': _platform,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'app_version': serializeParam(
          _appVersion,
          ParamType.String,
        ),
        'bundle_version': serializeParam(
          _bundleVersion,
          ParamType.String,
        ),
        'model': serializeParam(
          _model,
          ParamType.String,
        ),
        'platform': serializeParam(
          _platform,
          ParamType.String,
        ),
      }.withoutNulls;

  static AppInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      AppInfoStruct(
        appVersion: deserializeParam(
          data['app_version'],
          ParamType.String,
          false,
        ),
        bundleVersion: deserializeParam(
          data['bundle_version'],
          ParamType.String,
          false,
        ),
        model: deserializeParam(
          data['model'],
          ParamType.String,
          false,
        ),
        platform: deserializeParam(
          data['platform'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AppInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AppInfoStruct &&
        appVersion == other.appVersion &&
        bundleVersion == other.bundleVersion &&
        model == other.model &&
        platform == other.platform;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([appVersion, bundleVersion, model, platform]);
}

AppInfoStruct createAppInfoStruct({
  String? appVersion,
  String? bundleVersion,
  String? model,
  String? platform,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AppInfoStruct(
      appVersion: appVersion,
      bundleVersion: bundleVersion,
      model: model,
      platform: platform,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AppInfoStruct? updateAppInfoStruct(
  AppInfoStruct? appInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    appInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAppInfoStructData(
  Map<String, dynamic> firestoreData,
  AppInfoStruct? appInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (appInfo == null) {
    return;
  }
  if (appInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && appInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final appInfoData = getAppInfoFirestoreData(appInfo, forFieldValue);
  final nestedData = appInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = appInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAppInfoFirestoreData(
  AppInfoStruct? appInfo, [
  bool forFieldValue = false,
]) {
  if (appInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(appInfo.toMap());

  // Add any Firestore field values
  appInfo.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAppInfoListFirestoreData(
  List<AppInfoStruct>? appInfos,
) =>
    appInfos?.map((e) => getAppInfoFirestoreData(e, true)).toList() ?? [];
