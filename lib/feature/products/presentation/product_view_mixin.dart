part of 'product_view.dart';

mixin _ProductViewMixin on ConsumerState<ProductView> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetch();
    });
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        _fetch();
      }
    });
  }

  Future<void> _fetch() async {
    if (!mounted) return;
    await ref.read(productsNotifierProvider.notifier).fetchProducts();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
