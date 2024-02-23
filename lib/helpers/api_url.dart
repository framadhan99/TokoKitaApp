const String development = "http://10.0.2.2:8000";
const String endpoint = "$development/api";

class ApiUrl {
  static const String registrasi = "$endpoint/users/register";
  static const String login = "$endpoint/users/login";
  static const String logout = "$endpoint/users/logout";
  static const String listProduk = "$endpoint/produk/list";
  static const String createProduk = "$endpoint/produk/create";
  static const String updateProduk = "$endpoint/produk/update";
  static const String showProduk = "$endpoint/produk";
  static const String deleteProduk = "$endpoint/produk/delete";
}
