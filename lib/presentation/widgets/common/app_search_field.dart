import 'package:bus_proj/bloc/bus_bloc.dart';
import 'package:bus_proj/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:searchfield/searchfield.dart';

class AppSearchField extends StatelessWidget {
  final BusBloc bloc;
  final TextEditingController controller;
  final PhosphorIcon prefixIcon;
  final Function(String?)? validator;
  final String hintText;
  const AppSearchField({
    super.key,
    required this.bloc,
    required this.controller,
    required this.prefixIcon,
    required this.hintText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SearchField(
      controller: controller,
      autoCorrect: true,
      maxSuggestionsInViewPort: 3,
      marginColor: Colors.transparent,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      suggestionsDecoration: SuggestionDecoration(
        padding: const EdgeInsets.all(4),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      searchInputDecoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        prefixIcon: prefixIcon,
      ),
      offset: const Offset(0, 50),
      validator: (value) => validator != null ? validator!(value) : null,
      itemHeight: screenHeight * 0.05,
      scrollbarDecoration: ScrollbarDecoration(
        radius: const Radius.circular(10),
        thickness: 3,
        thumbColor: Theme.of(context).colorScheme.outline,
      ),
      suggestions: stations
          .map((e) => SearchFieldListItem(e,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  e,
                ),
              )))
          .toList(),
    );
  }
}