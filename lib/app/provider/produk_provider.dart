import 'package:flutter/material.dart';
import 'package:tokokita/app/repositories/produkRepository.dart';
import 'package:tokokita/config/config.dart';
import 'package:tokokita/config/snackbar_helper.dart';
import 'package:tokokita/ui_features/pages/home/detail_produk_page.dart';
import 'package:tokokita/ui_features/pages/home/home_page.dart';

import '../models/produk.dart';

class ProdukProvider extends ChangeNotifier {
  bool _isLoading = false;
  List<Produk> listProduk = [];
  Produk produk = Produk();

  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      _isLoading = val;
      notifyListeners();
    });
  }

  ProdukProvider() {
    initialize();
  }

  void initialize() {
    notifyListeners();
    getAllProduk();
  }

  Future createProduk(
    String kodeProduk,
    String namaProduk,
    String harga,
  ) async {
    isLoading = true;
    var res = await ProdukRepository().createProdukRepository({
      "kode_produk": kodeProduk,
      "nama_produk": namaProduk,
      "harga": harga,
    }).then((value) {
      initialize();
      showInSnackBar("Produk di Tambahkan");
      nextScreen(HomePage());
    });
    isLoading = false;

    notifyListeners();
  }

  Future<void> getAllProduk() async {
    isLoading = true;
    try {
      final result = await ProdukRepository().getAllProduk();
      if (result != null) {
        listProduk = result;
      }
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
    isLoading = false;
    notifyListeners();
  }

  // Future<void> showProduk(int id) async {
  //   isLoading = true;
  //   try {
  //     final result = await ProdukRepository().showProduk(id);
  //     if (result != null) {
  //       produk = result;
  //     }
  //     nextScreen(DetailProduk(
  //       kodeProduk: produk.kode_produk ?? "",
  //       namaProduk: produk.nama_produk ?? "",
  //       harga: produk.harga ?? 0,
  //     ));
  //     notifyListeners();
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  //   isLoading = false;
  //   notifyListeners();
  // }

  Future<void> updateProduk(
    String kodeProduk,
    String namaProduk,
    String harga,
    int id,
  ) async {
    isLoading = true;
    var res = await ProdukRepository().updateProdukRepository(
      {
        "kode_produk": kodeProduk,
        "nama_produk": namaProduk,
        "harga": harga,
      },
      id,
    ).then((value) {
      initialize();
      showInSnackBar("Produk di Update");
      nextScreen(HomePage());
    });

    isLoading = false;

    notifyListeners();
  }

  Future<void> deleteProduk(int id) async {
    isLoading = true;
    listProduk.removeWhere((element) => element.id == id);
    var res = await ProdukRepository().deleteProdukRepository(id).then(
      (value) {
        initialize();
        showInSnackBar("Delete Success");
        nextScreen(HomePage());
      },
    );
  }
}
