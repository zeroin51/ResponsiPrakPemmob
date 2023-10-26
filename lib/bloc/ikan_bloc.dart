import 'dart:convert';

import 'package:responsi/helpers/api.dart';
import 'package:responsi/helpers/api_url.dart';
import 'package:responsi/model/ikan.dart';

class IkanBloc {
  static Future<List<Ikan>> getIkans() async {
    String apiUrl = ApiUrl.listIkan;
    var response = await Api().get(apiUrl);
    var jsonObj = json.decode(response.body);
    List<dynamic> listIkan = (jsonObj as Map<String, dynamic>)['data'];
    List<Ikan> produks = [];
    for (int i = 0; i < listIkan.length; i++) {
      produks.add(Ikan.fromJson(listIkan[i]));
    }
    return produks;
  }

  static Future addIkan({Ikan? ikan}) async {
    String apiUrl = ApiUrl.createIkan;
    var body = {
      "nama": ikan!.nama,
      "jenis": ikan.jenis,
      "warna": ikan.warna,
      "habitat": ikan.habitat
    };
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['status'];
  }

  static Future<bool> updateIkan({required Ikan ikan}) async {
    String apiUrl = ApiUrl.updateIkan(ikan.id!);
    var body = {
      "nama": ikan!.nama,
      "jenis": ikan.jenis,
      "warna": ikan.warna,
      "habitat": ikan.habitat
    };
    var response = await Api().put(apiUrl, body);
    var jsonObj = json.decode(response.body);
    print("JsonObj : ${jsonObj['data']}");
    return jsonObj['status'];
  }

  static Future<bool> deleteIkan({int? id}) async {
    String apiUrl = ApiUrl.deleteIkan(id!);
    var response = await Api().delete(apiUrl);
    var jsonObj = json.decode(response.body);
    return (jsonObj as Map<String, dynamic>)['data'];
  }
}


