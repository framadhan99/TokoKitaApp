import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokokita/app/provider/auth_provider.dart';
import 'package:tokokita/app/provider/produk_provider.dart';
import 'package:tokokita/ui_features/pages/home/detail_produk_page.dart';
import 'package:tokokita/ui_features/widgets/card_produk.dart';

import '../../../config/config.dart';
import '../../../config/ui_helper.dart';
import 'add_produk_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    // context.read<ProdukProvider>().initialize();
    super.initState();
  }

  Future<void> refreshData() async {
    await context.watch<ProdukProvider>().getAllProduk();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProdukProvider>(builder: (context, prov, _) {
      if (prov.isLoading == true) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        child: const Icon(Icons.add),
                        onTap: () => nextScreen(const AddProdukPage()),
                      ),
                      horizontalSpace(16),
                      InkWell(
                        child: const Icon(
                          Icons.logout,
                          color: AssetColors.orangePastel,
                        ),
                        onTap: () {
                          context.read<AuthProvider>().logout();
                        },
                      ),
                    ],
                  ),
                ),
                RefreshIndicator(
                  key: _refreshIndicatorKey,
                  onRefresh: refreshData,
                  child: Column(
                    children: List.generate(
                      prov.listProduk.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 15,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            nextScreen(
                                DetailProduk(produk: prov.listProduk[index]));
                          },
                          child: CardProduk(
                            produk: prov.listProduk[index].nama_produk,
                            harga: prov.listProduk[index].harga.toString(),
                            // id: prov.listProduk[index].id,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
