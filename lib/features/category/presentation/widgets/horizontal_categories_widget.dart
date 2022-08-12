import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/features/category/presentation/bloc/bloc/category_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../advers/data/models/adver_input_model/fetch_input_model.dart';
import '../../../advers/presentation/bloc/adver_bloc.dart';

class HorizontalCategoriesWidget extends StatefulWidget {
  const HorizontalCategoriesWidget({Key? key}) : super(key: key);

  @override
  State<HorizontalCategoriesWidget> createState() =>
      _HorizontalCategoriesWidgetState();
}

class _HorizontalCategoriesWidgetState
    extends State<HorizontalCategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    CategoryBloc categoryBloc = context.read<CategoryBloc>();
    CategoryEvent event = FetchCategoryEvent();
    categoryBloc.add(event);
    return Material(
      child: BlocConsumer<CategoryBloc, CategoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.categoryStatus == CategoryStatus.initial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.categoryStatus == CategoryStatus.success) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      AdverBloc adverBloc = context.read<AdverBloc>();
                      adverBloc.fetchInputModel.catId =
                          state.categoryEntities[index].xCategoryIdPk;
                      AdverEvent event = AdverFilterEvent();
                      adverBloc.add(event);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Color(0XFFDBDBDB)),
                              bottom: BorderSide(color: Color(0XFFDBDBDB)),
                              left: BorderSide(color: Color(0XFFDBDBDB)),
                              right: BorderSide(color: Color(0XFFDBDBDB)),
                            ),
                              color: Colors.white, shape: BoxShape.circle),
                            
                          child: Icon(
                            IconData(
                                int.parse(state.categoryEntities[index].xIcone!),
                                fontFamily: 'MaterialIcons'),
                            color: Color(0XFF707070),
                          ),
                        ),
                         Text(state.categoryEntities[index].xCatTitle!),
                      ],
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 20,
                  );
                },
                itemCount: state.categoryEntities.length);
          }
          if (state.categoryStatus == CategoryStatus.failure) {
            return Text(state.errorMessage!);
          }
          return Container();
        },
      ),
    );
  }
}
