import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ListProdukModel {
  final String? message;
  final List<Produk> data;
  ListProdukModel({
    this.message,
    required this.data,
  });

  ListProdukModel copyWith({
    ValueGetter<String?>? message,
    List<Produk>? data,
  }) {
    return ListProdukModel(
      message: message != null ? message() : this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory ListProdukModel.fromMap(Map<String, dynamic> map) {
    return ListProdukModel(
      message: map['message'],
      data: List<Produk>.from(map['data']?.map((x) => Produk.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListProdukModel.fromJson(String source) =>
      ListProdukModel.fromMap(json.decode(source));

  @override
  String toString() => 'ListProdukModel(message: $message, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListProdukModel &&
        other.message == message &&
        listEquals(other.data, data);
  }

  @override
  int get hashCode => message.hashCode ^ data.hashCode;
}

class Produk {
  final int? id;
  final String? kode_produk;
  final String? nama_produk;
  final int? harga;
  Produk({
    this.id,
    this.kode_produk,
    this.nama_produk,
    this.harga,
  });

  Produk copyWith({
    ValueGetter<int?>? id,
    ValueGetter<String?>? kode_produk,
    ValueGetter<String?>? nama_produk,
    ValueGetter<int?>? harga,
  }) {
    return Produk(
      id: id != null ? id() : this.id,
      kode_produk: kode_produk != null ? kode_produk() : this.kode_produk,
      nama_produk: nama_produk != null ? nama_produk() : this.nama_produk,
      harga: harga != null ? harga() : this.harga,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'kode_produk': kode_produk,
      'nama_produk': nama_produk,
      'harga': harga,
    };
  }

  factory Produk.fromMap(Map<String, dynamic> map) {
    return Produk(
      id: map['id']?.toInt(),
      kode_produk: map['kode_produk'],
      nama_produk: map['nama_produk'],
      harga: map['harga']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Produk.fromJson(String source) => Produk.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Produk(id: $id, kode_produk: $kode_produk, nama_produk: $nama_produk, harga: $harga)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Produk &&
        other.id == id &&
        other.kode_produk == kode_produk &&
        other.nama_produk == nama_produk &&
        other.harga == harga;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        kode_produk.hashCode ^
        nama_produk.hashCode ^
        harga.hashCode;
  }
}
