import 'package:flutter/cupertino.dart';
import 'package:shopping_cart_app/models/products.dart';

class ProductController extends ChangeNotifier {
  List<Product> addedProduct = [];
  List<Product> likedProduct = [];

  get totalPrice {
    double price = 0.0;
    for (Product product in addedProduct) {
      price = (price + (product.price * product.quantity));
    }
    return price;
  }

  get totalProducts {
    int products = 0;
    for (Product product in addedProduct) {
      products = products + product.quantity;
    }
    return products;
  }

  void addProduct({required Product product}) {
    int flag = 0;
    for (Product addProduct in addedProduct) {
      if (addProduct.id == product.id) {
        product.quantity = product.quantity + 1;
        addProduct.price2 = addProduct.price * product.quantity;
        flag = 1;
        notifyListeners();
      }
      notifyListeners();
    }
    if (flag == 0) {
      addedProduct.add(product);
      notifyListeners();
    }
  }

  likeProduct({required Product product}) {
    if (product.isLike == "false") {
      product.isLike = "true";

      likedProduct.add(product);
      notifyListeners();
    } else {
      product.isLike = "false";
      likedProduct.remove(product);
      notifyListeners();
    }
  }

  void removeProduct({required Product product}) {
    if (product.quantity > 1) {
      product.quantity = product.quantity - 1;
      product.price2 = product.price * product.quantity;
      notifyListeners();
    } else {
      addedProduct.remove(product);
      notifyListeners();
    }
  }
}
