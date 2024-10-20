part of 'home_view.dart';

mixin _HomeViewMixin on ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchProducts();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.locale;
  }

  Future<void> _fetchProducts() async {
    if (!mounted) return;

    await ref.read(homeNotifierProvider.notifier).get10Product();
  }
}
