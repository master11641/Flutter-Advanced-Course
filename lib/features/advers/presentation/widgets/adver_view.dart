import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/features/advers/data/models/adver_input_model/fetch_input_model.dart';
import 'package:flutter_advanced_course/features/advers/presentation/bloc/adver_bloc.dart';
import 'package:flutter_advanced_course/features/advers/presentation/bloc/adver_status.dart';
import 'package:flutter_advanced_course/features/advers/presentation/widgets/adver_List_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/bottom_loader.dart';
import '../../../category/presentation/widgets/horizontal_categories_widget.dart';

class AdverView extends StatefulWidget {
  AdverView({Key? key}) : super(key: key);

  @override
  State<AdverView> createState() => _AdverViewState();
}

class _AdverViewState extends State<AdverView> {
  final _scrollController = ScrollController();
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
      appBar: AppBar(),
      body: Column(
        children: [
                 Container(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      height: 80,
                      child:const HorizontalCategoriesWidget(),            
                    ),
          BlocConsumer<AdverBloc, AdverState>(
            listener: (context, state) {},
            builder: (context, state) {
              //  List<AdverEntity> advers=[];
              if (state.adverStatus is AdverInit) {
                return const Center(child:CircularProgressIndicator()) ;
              }
              if (state.adverStatus is AdverCompleted) {
                AdverCompleted StateComplete = state.adverStatus as AdverCompleted;
                return
             
                    Expanded(
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
