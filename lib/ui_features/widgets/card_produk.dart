import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../../config/ui_helper.dart';

class CardProduk extends StatelessWidget {
  const CardProduk({
    Key? key,
    this.produk,
    this.harga,
  }) : super(key: key);

  final String? produk;
  final String? harga;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: screenWidth(context),
      decoration: BoxDecoration(
          color: AssetColors.greenLight,
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                produk ?? "Produk",
                style: AssetStyles.smallTitle,
              ),
              Text(
                harga ?? "Harga",
                style: AssetStyles.smallDescription
                    .copyWith(fontSize: 14, color: AssetColors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
