class ApiConstant {
  static final String baseUrl = 'https://spotify23.p.rapidapi.com/';
  static final String getAlbums = 'albums';
  static String getOneProduct(int productId) => 'products/$productId';
  static final String getAllCategories = 'products/categories';
  static String getCategoryProducts(String catName) =>
      'products/category/$catName';
}
