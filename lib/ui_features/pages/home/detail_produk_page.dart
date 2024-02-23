import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tokokita/app/models/produk.dart';
import 'package:tokokita/app/provider/produk_provider.dart';
import 'package:tokokita/config/config.dart';
import 'package:tokokita/config/ui_helper.dart';
import 'package:tokokita/ui_features/pages/home/produk_edit_page.dart';
import 'package:tokokita/ui_features/widgets/button/button_primary.dart';

class DetailProduk extends StatefulWidget {
  const DetailProduk({
    Key? key,
    required this.produk,
  }) : super(key: key);
  final Produk produk;

  @override
  State<DetailProduk> createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProdukProvider>(builder: (context, prov, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Detail Produk"),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 38),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.produk.kode_produk ?? ""),
              Text(widget.produk.nama_produk ?? ""),
              Text(widget.produk.harga.toString()),
              verticalSpace(48),
              Row(
                children: [
                  ButtonPrimary(
                    label: "Edit",
                    width: 150,
                    onTap: () => nextScreen(ProdukEditPage(
                      produk: widget.produk,
                    )),
                  ),
                  Spacer(),
                  ButtonPrimary(
                    color: Colors.red,
                    label: "Delete",
                    width: 150,
                    onTap: () {
                      prov.deleteProduk(widget.produk.id!);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
