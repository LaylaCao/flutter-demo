import 'package:flutter/material.dart';

class Product {
  const Product({this.name});
  final String name;
}

typedef void CartChangedCallback(Product product, bool inCart);

// 该ShoppingListItem widget是无状态的。
// 它将其在构造函​​数中接收到的值存储在final成员变量中，然后在build函数中使用它们。
// 例如，inCart布尔值表示在两种视觉展示效果之间切换：一个使用当前主题的主色，另一个使用灰色。
class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
    :product = product,
    super(key: new ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if(!inCart) return null;

    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override

  // 当父项收到onCartChanged回调时，父项将更新其内部状态，
  // 这将触发父项使用新inCart值重建ShoppingListItem新实例。
  // 虽然父项ShoppingListItem在重建时创建了一个新实例，但该操作开销很小，
  // 因为Flutter框架会将新构建的widget与先前构建的widget进行比较，并仅将差异部分应用于底层RenderObject。
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: () {
        onCartChanged(product, !inCart);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name[0]),
      ),
      title: new Text(product.name, style: _getTextStyle(context)),
    );
  }
}

// 父widget存储可变状态的示例：

class ShoppingList extends StatefulWidget {
  // 使用key来控制框架将在widget重建时与哪些其他widget匹配。
  ShoppingList({Key key, this.products}) : super(key: key);

  final List<Product> products;

  // The framework calls createState the first time a widget appears at a given
  // location in the tree. If the parent rebuilds and uses the same type of
  // widget (with the same key), the framework will re-use the State object
  // instead of creating a new State object.

  @override

  //  当ShoppingList首次插入到树中时，框架会调用其 createState 函数以创建一个
  //  新的_ShoppingListState实例来与该树中的相应位置关联
  _ShoppingListState createState() => new _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product>_shoppingCart = new Set<Product>();
  
  void _handleCartChanged(Product product, bool inCart) {
    // 为了通知框架它改变了它的内部状态，需要调用setState。
    // 调用setState将该widget标记为”dirty”(脏的)，并且计划在下次应用程序需要更新屏幕时重新构建它。
    // 如果在修改widget的内部状态后忘记调用setState，框架将不知道您的widget是”dirty”(脏的)，
    // 并且可能不会调用widget的build方法，这意味着用户界面可能不会更新以展示新的状态。
    setState(() {
      if(inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Shopping List'),
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return new ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList()
      ),
    );
  }
}

void main() {
  runApp(new MaterialApp(
    title: 'Shopping App',
    home: new ShoppingList(
      products: <Product>[
        // Key在构建相同类型widget的多个实例时很有用。例如，ShoppingList构建足够的ShoppingListItem实例以填充其可见区域
        new Product(name: '小'),
        new Product(name: '可'),
        new Product(name: '爱'),
        new Product(name: '是'),
        new Product(name: '曹'),
        new Product(name: '佳'),
        new Product(name: '丽'),
      ],
    ),
  ));
}

