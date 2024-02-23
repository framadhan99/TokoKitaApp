import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokokita/app/provider/produk_provider.dart';
import 'package:tokokita/ui_features/widgets/button/button_primary.dart';

import '../../../config/config.dart';
import '../../../config/ui_helper.dart';
import '../../widgets/textfield_general.dart';
import 'home_page.dart';

class AddProdukPage extends StatefulWidget {
  const AddProdukPage({super.key});

  @override
  State<AddProdukPage> createState() => _AddProdukPageState();
}

class _AddProdukPageState extends State<AddProdukPage> {
  final TextEditingController kodeProdukController = TextEditingController();
  final TextEditingController namaProdukController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ProdukProvider>(builder: (context, prov, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Add Produk"),
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
                  label: 'Add',
                  width: 114,
                  onTap: () {
                    prov.createProduk(kodeProdukController.text,
                        namaProdukController.text, hargaController.text);
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
