

import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/features/advers/presentation/bloc/adver_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatFilterView extends StatefulWidget {
  CatFilterView({Key? key}) : super(key: key);

  @override
  State<CatFilterView> createState() => _CatFilterViewState();
}

class _CatFilterViewState extends State<CatFilterView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocBuilder<AdverBloc, AdverState>(
        builder: (context, state) {
          return Container();
        },
      ),
    );
  }
}