import 'package:dio/dio.dart';
import 'package:tokokita/app/models/produk.dart';
import 'package:tokokita/config/log_helper.dart';
import 'package:tokokita/helpers/api_url.dart';
import 'package:tokokita/helpers/user_info.dart';

class ProdukRepository {
  Dio _dio = Dio();

  Future<Produk?> createProdukRepository(Map<String, dynamic> request) async {
    String? token = await UserInfo().getToken();
    try {
      final Options options = Options(headers: {
        "Accept": "application/json",
        "Authorization": token,
      });
      var res =
          await _dio.post(ApiUrl.createProduk, options: options, data: request);
      if (res.statusCode == 200) {
        Log.success(res);
        var data = res.data;
        return Produk.fromMap(data);
      }
    } on DioException catch (e) {
      Log.error(e);
    }

    return null;
  }

  Future<Produk?> getProduk() async {
    String? token = await UserInfo().getToken();
    try {
      final Options options = Options(headers: {
        "Accept": "application/json",
        "Authorization": token,
      });
      var res = await _dio.get(ApiUrl.listProduk, options: options);
      if (res.statusCode == 200) {
        Log.success(res);
        var data = res.data;
        return Produk.fromMap(data);
      }
    } on DioException catch (e) {
      Log.error(e);
    }

    return null;
  }

  Future<ListProdukModel?> getAllResponseProduk() async {
    String? token = await UserInfo().getToken();
    final Options options = Options(headers: {
      "Accept": "application/json",
      "Authorization": token,
    });
    final res = await _dio.get(ApiUrl.listProduk, options: options);
    try {
      final data = res.data;
      return ListProdukModel.fromMap(data);
    } on DioException catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Produk>?> getAllProduk() async {
    final result = await getAllResponseProduk();
    try {
      if (result != null) {
        final ListProdukModel res = result;
        return res.data;
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Produk?> updateProdukRepository(
      Map<String, dynamic> request, int id) async {
    String? token = await UserInfo().getToken();
    try {
      final Options options = Options(headers: {
        "Accept": "application/json",
        "Authorization": token,
      });
      var res = await _dio.post("${ApiUrl.updateProduk}/$id",
          options: options, data: request);
      if (res.statusCode == 200) {
        Log.success(res);
        var data = res.data;
        return Produk.fromMap(data);
      }
    } on DioException catch (e) {
      Log.error(e);
    }

    return null;
  }

  Future<void> deleteProdukRepository(int id) async {
    String? token = await UserInfo().getToken();
    try {
      final Options options = Options(headers: {
        "Accept": "application/json",
        "Authorization": token,
      });
      var res = await _dio.post("${ApiUrl.deleteProduk}/$id", options: options);
      if (res.statusCode == 200) {
        Log.success(res);
      }
    } on DioException catch (e) {
      Log.error(e);
    }

    return null;
  }
}
