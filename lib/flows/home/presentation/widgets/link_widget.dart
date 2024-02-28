import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webspark_test/flows/home/presentation/logic/home_cubit.dart';

class LinkWidget extends StatefulWidget {
  const LinkWidget({super.key});

  @override
  State<LinkWidget> createState() => _LinkWidgetState();
}

class _LinkWidgetState extends State<LinkWidget> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final text = context.read<HomeCubit>().state.link;
    _controller = TextEditingController(text: text);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.swap_horiz_outlined),
        const SizedBox(width: 16),
        Expanded(
          child: TextField(
            controller: _controller,
            onChanged: context.read<HomeCubit>().setLink,
          ),
        ),
      ],
    );
  }
}
