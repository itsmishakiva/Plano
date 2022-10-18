///
//  Generated code. Do not modify.
//  source: issue.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'issue.pb.dart' as $0;
import 'common.pb.dart' as $1;
export 'issue.pb.dart';

class IssueServiceClient extends $grpc.Client {
  static final _$search =
      $grpc.ClientMethod<$0.IssueSearchRequest, $0.IssueList>(
          '/ru.plano.IssueService/search',
          ($0.IssueSearchRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.IssueList.fromBuffer(value));
  static final _$create =
      $grpc.ClientMethod<$0.IssueCreateRequest, $0.IssueDto>(
          '/ru.plano.IssueService/create',
          ($0.IssueCreateRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.IssueDto.fromBuffer(value));
  static final _$edit = $grpc.ClientMethod<$0.IssueEditRequest, $0.IssueDto>(
      '/ru.plano.IssueService/edit',
      ($0.IssueEditRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.IssueDto.fromBuffer(value));
  static final _$delete =
      $grpc.ClientMethod<$0.IssueDeleteRequest, $1.MessageReply>(
          '/ru.plano.IssueService/delete',
          ($0.IssueDeleteRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.MessageReply.fromBuffer(value));

  IssueServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.IssueList> search($0.IssueSearchRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$search, request, options: options);
  }

  $grpc.ResponseFuture<$0.IssueDto> create($0.IssueCreateRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create, request, options: options);
  }

  $grpc.ResponseFuture<$0.IssueDto> edit($0.IssueEditRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$edit, request, options: options);
  }

  $grpc.ResponseFuture<$1.MessageReply> delete($0.IssueDeleteRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete, request, options: options);
  }
}

abstract class IssueServiceBase extends $grpc.Service {
  $core.String get $name => 'ru.plano.IssueService';

  IssueServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.IssueSearchRequest, $0.IssueList>(
        'search',
        search_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.IssueSearchRequest.fromBuffer(value),
        ($0.IssueList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.IssueCreateRequest, $0.IssueDto>(
        'create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.IssueCreateRequest.fromBuffer(value),
        ($0.IssueDto value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.IssueEditRequest, $0.IssueDto>(
        'edit',
        edit_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.IssueEditRequest.fromBuffer(value),
        ($0.IssueDto value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.IssueDeleteRequest, $1.MessageReply>(
        'delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.IssueDeleteRequest.fromBuffer(value),
        ($1.MessageReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.IssueList> search_Pre($grpc.ServiceCall call,
      $async.Future<$0.IssueSearchRequest> request) async {
    return search(call, await request);
  }

  $async.Future<$0.IssueDto> create_Pre($grpc.ServiceCall call,
      $async.Future<$0.IssueCreateRequest> request) async {
    return create(call, await request);
  }

  $async.Future<$0.IssueDto> edit_Pre($grpc.ServiceCall call,
      $async.Future<$0.IssueEditRequest> request) async {
    return edit(call, await request);
  }

  $async.Future<$1.MessageReply> delete_Pre($grpc.ServiceCall call,
      $async.Future<$0.IssueDeleteRequest> request) async {
    return delete(call, await request);
  }

  $async.Future<$0.IssueList> search(
      $grpc.ServiceCall call, $0.IssueSearchRequest request);
  $async.Future<$0.IssueDto> create(
      $grpc.ServiceCall call, $0.IssueCreateRequest request);
  $async.Future<$0.IssueDto> edit(
      $grpc.ServiceCall call, $0.IssueEditRequest request);
  $async.Future<$1.MessageReply> delete(
      $grpc.ServiceCall call, $0.IssueDeleteRequest request);
}
