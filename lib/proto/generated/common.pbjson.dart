///
//  Generated code. Do not modify.
//  source: common.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use priorityDescriptor instead')
const Priority$json = const {
  '1': 'Priority',
  '2': const [
    const {'1': 'LOW', '2': 0},
    const {'1': 'MEDIUM', '2': 1},
    const {'1': 'HIGH', '2': 2},
    const {'1': 'URGENT', '2': 3},
    const {'1': 'NONE', '2': 4},
  ],
};

/// Descriptor for `Priority`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List priorityDescriptor = $convert.base64Decode(
    'CghQcmlvcml0eRIHCgNMT1cQABIKCgZNRURJVU0QARIICgRISUdIEAISCgoGVVJHRU5UEAMSCAoETk9ORRAE');
@$core.Deprecated('Use statusDescriptor instead')
const Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'BACKLOG', '2': 0},
    const {'1': 'UNSTARTED', '2': 1},
    const {'1': 'STARTED', '2': 2},
    const {'1': 'COMPLETED', '2': 3},
    const {'1': 'CANCELED', '2': 4},
    const {'1': 'REVIEW', '2': 5},
  ],
};

/// Descriptor for `Status`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List statusDescriptor = $convert.base64Decode(
    'CgZTdGF0dXMSCwoHQkFDS0xPRxAAEg0KCVVOU1RBUlRFRBABEgsKB1NUQVJURUQQAhINCglDT01QTEVURUQQAxIMCghDQU5DRUxFRBAEEgoKBlJFVklFVxAF');
@$core.Deprecated('Use messageReplyDescriptor instead')
const MessageReply$json = const {
  '1': 'MessageReply',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `MessageReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageReplyDescriptor = $convert
    .base64Decode('CgxNZXNzYWdlUmVwbHkSGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZQ==');
