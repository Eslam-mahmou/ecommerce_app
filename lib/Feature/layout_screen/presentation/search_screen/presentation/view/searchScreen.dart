import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/search_cubit/search_cubit.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/search_cubit/search_state.dart';
import 'package:ecommerce_app/core/Services/servier_locator.dart';
import 'package:ecommerce_app/core/Utils/colors_manager.dart';
import 'package:ecommerce_app/core/Utils/font_manager.dart';
import 'package:ecommerce_app/core/Utils/style_manager.dart';
import 'package:ecommerce_app/core/routes_manager/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/Widget/custom_diaolg.dart';
import '../widget/custom_search.dart';
import '../widget/custom_search_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = getIt<SearchCubit>();
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(children: [
        const CustomSearch(),
        SizedBox(
          height: 16.h,
        ),
        BlocConsumer<SearchCubit, SearchState>(
          bloc: viewModel..search(),
          listener: (context, state) {
            // if (state is FailedSearchState) {
            //   DialogUtils.showMessage(
            //     context: context,
            //     message: state.errMessage,
            //     postActionName: "Ok",
            //   );
            // }
          },
          builder: (context, state) {
            return state is LoadingSearchState
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state is SuccessfulSearchState && state.products.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                            itemCount: viewModel.products.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  viewModel.products
                                      .add(viewModel.products[0]);
                                  Navigator.pushNamed(
                                      context, PagesRoutes.productDetailScreen,
                                      arguments: viewModel.products[index]);
                                },
                                child: CustomSearchItem(
                                  product: viewModel.products[index],
                                ),
                              );
                            }))
                    : const Center(child: Text('No results found'));
          },
        ),
      ]),
    )));
  }
}
