class Api {
  //base Url
  static const String baseUrl = "https://elbanna.zahey.xyz/api/admin/";

  static const String imageBaseUrl = "https://omar-1.zahey.xyz/";

  static const String getAllProductsApiCall = "auth/all-products";
  static const String getAllCouponsApiCall = "auth/all-coupons";
  static const String getAllBannersApiCall = "auth/all-sliders";
  static const String getAllCategoriesApiCall = "auth/all-categories";
  static const String getAllBrandsApiCall = "auth/all-brands";
  static const String getAllOffersApiCall = "auth/all-offers";
  static String deleteProductApiCall(int productId) =>
      "auth/delete-product/$productId";

  static String getProductApiCall(int productId) =>
      "auth/single-product/$productId";
  static String deleteCouponApiCall(int couponId) =>
      "auth/delete-coupon/$couponId";
  static String deleteBannerApiCall(int bannerId) =>
      "auth/delete-slider/$bannerId";
  static String deleteCategoryApiCall(int categoryId) =>
      "auth/delete-category/$categoryId";
  static String deleteBrandApiCall(int brandsId) =>
      "auth/delete-brand/$brandsId";
  static String deleteOfferApiCall(int offerId) =>
      "auth/delete-offer/$offerId";
  static const String checkPhoneApi = "seller/check-phone";
  static const String verifyCodeApi = "seller/verify-code";
  static const String homeApi = "auth/home-apis";
  static const String allOrdersApi = "auth/all-orders";
  static const String addProductApi = "auth/store-product";

  static const String addSliderApi = "auth/store-slider";
  static const String addCategoryApi = "auth/store-category";
  static const String addOfferApi = "auth/store-offer";
  static const String addBrandApi = "auth/store-brand";
  static const String addCouponApi = "auth/store-coupon";

  static String orderApi(int orderId) =>
      "auth/single-order/$orderId";
  static String updateOrderApi(int orderId) =>
      "auth/update-order-status/$orderId";
  static String updateProduct(int productId) =>
      "auth/update-product/$productId";
  static String getProductByCategoryIdApiCall(int categoryId) =>
      "category/$categoryId";

  static const String doLogoutApiCall = "logout";
}
