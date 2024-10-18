import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mdp_case_study/product/model/user.dart';
import 'package:mdp_case_study/product/state/auth_view_model.dart';
import 'package:mdp_case_study/product/widgets/app_spacer.dart';

@RoutePage()
class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authNotifierProvider).userModel;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Ana Sayfa',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/language_icon.svg'),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/exit_icon.svg'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    ClipOval(
                      child: CachedNetworkImage(
                        width: 120.w,
                        height: 120.h,
                        fit: BoxFit.cover,
                        imageUrl: user?.image ??
                            'https://fastly.picsum.photos/id/525/350/250.jpg?hmac=HiUCjE10AK20KQzuT3VPuGmNStnzJdTkq2j5no02DRk',
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.grey),
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: const Icon(Icons.abc),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
