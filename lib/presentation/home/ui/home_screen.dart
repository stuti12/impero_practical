import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practical_stuti/data/repository/home_page_repository_impl.dart';
import 'package:practical_stuti/presentation/home/cubit/home_page_cubit.dart';
import 'package:practical_stuti/presentation/home/ui/ceramic_screen.dart';
import 'package:practical_stuti/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: HomePageCubit(homePageRepository: HomePageRepositoryImpl()),
      child: BlocBuilder<HomePageCubit, HomePageState>(
        buildWhen: (previous, current) =>
            previous.categoryList != current.categoryList,
        builder: (context, state) {
          return DefaultTabController(
            length: state.categoryList.isEmpty ? 0 : state.categoryList.length,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: AppColors.black,
                bottom: state.categoryList.isEmpty
                    ? null
                    : TabBar(
                        isScrollable: true,
                        tabAlignment: TabAlignment.center,
                        padding: EdgeInsets.zero,
                        labelColor: AppColors.white,
                        tabs: state.categoryList
                            .map(
                              (category) => Tab(
                                text: category.name,
                              ),
                            )
                            .toList(),
                      ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_alt_sharp),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
              body: state.categoryList.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : TabBarView(
                      children: state.categoryList
                          .map(
                            (category) => const CeramicScreen(),
                          )
                          .toList(),
                    ),
            ),
          );
        },
      ),
    );
  }
}
