import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/features/advers/data/models/adver_input_model/fetch_input_model.dart';
import 'package:flutter_advanced_course/features/advers/data/repository/adver_repositoryImpl.dart';
import 'package:flutter_advanced_course/features/advers/domain/use_cases/get_advers_usecase.dart';
import 'package:flutter_advanced_course/features/advers/presentation/bloc/adver_bloc.dart';
import 'package:flutter_advanced_course/features/advers/presentation/bloc/adver_status.dart';
import 'package:flutter_advanced_course/features/advers/presentation/widgets/adver_List_item.dart';
import 'package:flutter_advanced_course/features/category/domain/entities/category_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../../core/widgets/bottom_loader.dart';
import '../../../category/presentation/widgets/horizontal_categories_widget.dart';
import '../../data/data_source/remote/api_provider.dart';
import '../../domain/repository/adver_repository.dart';

class AdverView extends StatefulWidget {
  AdverView({Key? key}) : super(key: key);

  @override
  State<AdverView> createState() => _AdverViewState();
}

class _AdverViewState extends State<AdverView> {
  final _scrollController = ScrollController();
  TextEditingController textEditingController = TextEditingController();
  AdverRepository _adverRepository =  AdverRepositoryImpl(AdverApiProvider());
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    AdverBloc adverBloc = context.read<AdverBloc>();
    AdverEvent event = AdverFetchEvent();
    adverBloc.add(event);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 10, left: 10),
              height: 80,
              child: const HorizontalCategoriesWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 10,
                left: 10,
              ),
              child: TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    onSubmitted: (String prefix) {
                      textEditingController.text = prefix;
                      // BlocProvider.of<HomeBloc>(context)
                      //     .add(LoadCwEvent(prefix));
                    },
                    controller: textEditingController,
                    style: DefaultTextStyle.of(context).style.copyWith(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      hintText: "Enter a City...",
                      hintStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  suggestionsCallback: (String prefix) {
                    return _adverRepository.getSuggests(2, prefix);
                  },
                  itemBuilder: (context, CategoryEntity model) {
                    return ListTile(
                      leading: const Icon(Icons.location_on),
                      title: Text(model.xCatTitle!),
                     // subtitle: Text("${model.region!}, ${model.country!}"),
                    );
                  },
                  onSuggestionSelected: (CategoryEntity model) {
                    textEditingController.text = model.xCatTitle!;
                    // BlocProvider.of<HomeBloc>(context)
                    //     .add(LoadCwEvent(model.name!));
                  }),
            ),
            BlocConsumer<AdverBloc, AdverState>(
              listener: (context, state) {},
              builder: (context, state) {
                //  List<AdverEntity> advers=[];
                if (state.adverStatus is AdverInit) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.adverStatus is AdverCompleted) {
                  AdverCompleted StateComplete =
                      state.adverStatus as AdverCompleted;
                  return Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      itemBuilder: (context, index) {
                        return index >=
                                context.read<AdverBloc>().adverItems.length
                            ? const BottomLoader()
                            : AdverListItem(
                                item: StateComplete.adverEntity.items![index]);
                      },
                      itemCount: StateComplete.adverEntity.hasMore!
                          ? StateComplete.adverEntity.items!.length + 1
                          : StateComplete.adverEntity.items!.length,
                    ),
                  );
                }
                if (state.adverStatus is AdverError) {
                  AdverError errorState = state.adverStatus as AdverError;
                  return Center(child: Text(errorState.message));
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      AdverBloc adverBloc = context.read<AdverBloc>();
      AdverEvent event = AdverFetchEvent();
      adverBloc.fetchInputModel.pageNumber =
          adverBloc.pageFetchedNumbers.last + 1;
      adverBloc.add(event);
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
