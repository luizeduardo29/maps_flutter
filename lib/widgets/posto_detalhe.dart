// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../model/posto.dart';

class PostoDetalhes extends StatelessWidget {
  Posto posto;
  PostoDetalhes({Key? key, required this.posto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blue),
      child: Wrap(
        children: [
          Image.network(
            posto.foto,
            height: 250,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(top: 24, left: 10),
            child: Text(
              posto.nome,
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 40, left: 10),
            child: Text(
              posto.endereco,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
