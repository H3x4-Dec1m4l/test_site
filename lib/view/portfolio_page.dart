import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my_portfolio'.i18n()),
        backgroundColor: Colors.black26,
      ),
      body: SingleChildScrollView(
        child: Container(
           decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/fundoUniverse.png'),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: <Widget>[
              
            ],
          ),
        ),
      ),
    );
  }
}