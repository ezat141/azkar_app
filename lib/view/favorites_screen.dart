import 'package:azkar_app/cubit/TasbeehCubit/tasbeeh_cubit.dart';
import 'package:azkar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          S.of(context).electronicRosary,
          style: const TextStyle(fontSize: 24, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => TasbeehCubit(),
        child: Center(
          child: BlocBuilder<TasbeehCubit, int>(
            builder: (context, count) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () =>
                        BlocProvider.of<TasbeehCubit>(context).increment(),
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xff859956),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff859956).withOpacity(0.12),
                            spreadRadius: 20,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          '$count',
                          style: const TextStyle(
                            fontSize: 36,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff859956).withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () =>
                          BlocProvider.of<TasbeehCubit>(context).reset(),
                      iconSize: 36,
                      color: const Color(0xff859956),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
