///
//  Generated code. Do not modify.
//  source: issue.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use issueSearchRequestDescriptor instead')
const IssueSearchRequest$json = const {
  '1': 'IssueSearchRequest',
  '2': const [
    const {'1': 'workspace_id', '3': 1, '4': 1, '5': 3, '10': 'workspaceId'},
  ],
};

/// Descriptor for `IssueSearchRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List issueSearchRequestDescriptor = $convert.base64Decode(
    'ChJJc3N1ZVNlYXJjaFJlcXVlc3QSIQoMd29ya3NwYWNlX2lkGAEgASgDUgt3b3Jrc3BhY2VJZA==');
@$core.Deprecated('Use issueCreateRequestDescriptor instead')
const IssueCreateRequest$json = const {
  '1': 'IssueCreateRequest',
  '2': const [
    const {'1': 'workspace_id', '3': 1, '4': 1, '5': 3, '10': 'workspaceId'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {
      '1': 'priority',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.ru.plano.Priority',
      '10': 'priority'
    },
    const {
      '1': 'status',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.ru.plano.Status',
      '10': 'status'
    },
  ],
};

/// Descriptor for `IssueCreateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List issueCreateRequestDescriptor = $convert.base64Decode(
    'ChJJc3N1ZUNyZWF0ZVJlcXVlc3QSIQoMd29ya3NwYWNlX2lkGAEgASgDUgt3b3Jrc3BhY2VJZBISCgRuYW1lGAIgASgJUgRuYW1lEiAKC2Rlc2NyaXB0aW9uGAMgASgJUgtkZXNjcmlwdGlvbhIuCghwcmlvcml0eRgEIAEoDjISLnJ1LnBsYW5vLlByaW9yaXR5Ughwcmlvcml0eRIoCgZzdGF0dXMYBSABKA4yEC5ydS5wbGFuby5TdGF0dXNSBnN0YXR1cw==');
@$core.Deprecated('Use issueEditRequestDescriptor instead')
const IssueEditRequest$json = const {
  '1': 'IssueEditRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {
      '1': 'priority',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.ru.plano.Priority',
      '10': 'priority'
    },
    const {
      '1': 'status',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.ru.plano.Status',
      '10': 'status'
    },
  ],
};

/// Descriptor for `IssueEditRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List issueEditRequestDescriptor = $convert.base64Decode(
    'ChBJc3N1ZUVkaXRSZXF1ZXN0Eg4KAmlkGAEgASgDUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEiAKC2Rlc2NyaXB0aW9uGAMgASgJUgtkZXNjcmlwdGlvbhIuCghwcmlvcml0eRgEIAEoDjISLnJ1LnBsYW5vLlByaW9yaXR5Ughwcmlvcml0eRIoCgZzdGF0dXMYBSABKA4yEC5ydS5wbGFuby5TdGF0dXNSBnN0YXR1cw==');
@$core.Deprecated('Use issueDeleteRequestDescriptor instead')
const IssueDeleteRequest$json = const {
  '1': 'IssueDeleteRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `IssueDeleteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List issueDeleteRequestDescriptor =
    $convert.base64Decode('ChJJc3N1ZURlbGV0ZVJlcXVlc3QSDgoCaWQYASABKANSAmlk');
@$core.Deprecated('Use issueDtoDescriptor instead')
const IssueDto$json = const {
  '1': 'IssueDto',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'internal_id', '3': 2, '4': 1, '5': 3, '10': 'internalId'},
    const {'1': 'workspace_id', '3': 3, '4': 1, '5': 3, '10': 'workspaceId'},
    const {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
    const {
      '1': 'priority',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.ru.plano.Priority',
      '10': 'priority'
    },
    const {
      '1': 'status',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.ru.plano.Status',
      '10': 'status'
    },
  ],
};

/// Descriptor for `IssueDto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List issueDtoDescriptor = $convert.base64Decode(
    'CghJc3N1ZUR0bxIOCgJpZBgBIAEoA1ICaWQSHwoLaW50ZXJuYWxfaWQYAiABKANSCmludGVybmFsSWQSIQoMd29ya3NwYWNlX2lkGAMgASgDUgt3b3Jrc3BhY2VJZBISCgRuYW1lGAQgASgJUgRuYW1lEiAKC2Rlc2NyaXB0aW9uGAUgASgJUgtkZXNjcmlwdGlvbhIuCghwcmlvcml0eRgGIAEoDjISLnJ1LnBsYW5vLlByaW9yaXR5Ughwcmlvcml0eRIoCgZzdGF0dXMYByABKA4yEC5ydS5wbGFuby5TdGF0dXNSBnN0YXR1cw==');
@$core.Deprecated('Use issueListDescriptor instead')
const IssueList$json = const {
  '1': 'IssueList',
  '2': const [
    const {
      '1': 'issues',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.ru.plano.IssueDto',
      '10': 'issues'
    },
  ],
};

/// Descriptor for `IssueList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List issueListDescriptor = $convert.base64Decode(
    'CglJc3N1ZUxpc3QSKgoGaXNzdWVzGAEgAygLMhIucnUucGxhbm8uSXNzdWVEdG9SBmlzc3Vlcw==');
