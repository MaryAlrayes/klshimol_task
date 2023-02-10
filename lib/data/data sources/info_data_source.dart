// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:klshimol_task/core/errors/exceptions.dart';
import 'package:klshimol_task/core/errors/failures.dart';
import 'package:klshimol_task/core/utils/constants/base_url.dart';
import 'package:klshimol_task/core/utils/helpers/decode_response.dart';
import 'package:klshimol_task/data/models/info_model.dart';

abstract class InfoDataSource {
  Future<Either<Failure, List<InfoModel>>> fetchInfo();
}

class InfoDataSourceWithHttp implements InfoDataSource {
  final http.Client client;
  InfoDataSourceWithHttp({
    required this.client,
  });

  @override
  Future<Either<Failure, List<InfoModel>>> fetchInfo() async {
    try {
      final response = await client.get(
        Uri.parse('$BASE_URL/GetCategoryDetails?Lang=En'),
        headers: {
          "content-type": "application/json; charset=utf-8",
          "Content-Encoding": "gzip",
            'Charset': 'utf-8'
        },
      );
      print('status code ${response.statusCode}');
      final decodedResponse = DecodeResponse.decode(response);
      print('decodedresponse $decodedResponse');
      final  infoDecompressed = decompress(decodedResponse['compressedData']);
      print('done $infoDecompressed');
      List<InfoModel> info = [];
      for (int i = 0; i < infoDecompressed.length; i++) {
        InfoModel infoModel = InfoModel.fromJson(infoDecompressed[i]);
        info.add(infoModel);
      }
      return Right(info);
    } on SocketException {
      throw ExceptionSocket();
    } on FormatException catch(e) {
      print(e);
      throw ExceptionFormat();
    } on TimeoutException {
      throw ExceptionTimeout();
    } on HandshakeException {
      throw ExceptionHandshake();
    } on CustomException catch (e) {
      throw CustomException(message: e.message);
    } on Exception {
      throw ExceptionOther();
    }
  }

 List<dynamic> decompress(String data) {
    final Uint8List compressed = base64Decode(data);
    if (compressed.length > 4) {
      List<int> decodedData =  gzip.decode(
        compressed.sublist(4, compressed.length - 4),
      );
      String utfDecoded = utf8.decode(decodedData,);
      return json.decode( utfDecoded) as List<dynamic>;
    } else {
      return [];
    }
  }
}
