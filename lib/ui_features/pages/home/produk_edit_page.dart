import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tokokita/app/provider/produk_provider.dart';
import 'package:tokokita/ui_features/widgets/button/button_primary.dart';

import '../../../app/models/produk.dart';
import '../../../config/config.dart';
import '../../../config/ui_helper.dart';
import '../../widgets/textfield_general.dart';

class ProdukEditPage extends StatefulWidget {
  const ProdukEditPage({
    Key? key,
    required this.produk,
  }) : super(key: key);

  final Produk produk;
  @override
  State<ProdukEditPage> createState() => _ProdukEditPageState();
}

class _ProdukEditPageState extends State<ProdukEditPage> {
  final TextEditingController kodeProdukController = TextEditingController();
  final TextEditingController namaProdukController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();

  void updateProduk() {
    kodeProdukController.text = widget.produk.kode_produk!;
    namaProdukController.text = widget.produk.nama_produk!;
    hargaController.text = widget.produk.harga.toString();
    setState(() {});
  }

  @override
  void initState() {
    updateProduk();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProdukProvider>(builder: (context, prov, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Produk"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kode Produk',
                style: AssetStyles.smallTitle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AssetColors.greenDark,
                ),
              ),
              verticalSpace(6),
              TextFieldGeneral(
                controller: kodeProdukController,
              ),
              verticalSpace(16),
              Text(
                'Nama Produk',
                style: AssetStyles.smallTitle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AssetColors.greenDark,
                ),
              ),
              verticalSpace(6),
              TextFieldGeneral(
                controller: namaProdukController,
              ),
              verticalSpace(16),
              Text(
                'Harga Produk',
                style: AssetStyles.smallTitle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AssetColors.greenDark,
                ),
              ),
              verticalSpace(6),
              TextFieldGeneral(
                controller: hargaController,
              ),
              verticalSpace(48),
              Align(
                alignment: Alignment.center,
                child: ButtonPrimary(
                  label: 'Update',
                  width: 114,
                  onTap: () {
                    prov.updateProduk(
                        kodeProdukController.text,
                        namaProdukController.text,
                        hargaController.text,
                        widget.produk.id ?? 0);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
