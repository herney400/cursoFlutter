import 'package:flutter/material.dart';
import 'pais.dart';

void main() => runApp(Paises());

class Paises extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Curso de flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListadoPaises(titulo: 'Paises UE'),
    );
  }
}

class ListadoPaises extends StatelessWidget {
  final String titulo;

  const ListadoPaises({required this.titulo}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(titulo),
        ),
        body: ListView.builder(
          itemCount: paises.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: ListTile(
                leading:
                    Image.asset("assets/banderas/" + paises[index].bandera),
                title: Text(paises[index].nombre),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FichaPais(pais: paises[index])),
                );
              },
            );
          },
        ));
  }
}

class FichaPais extends StatelessWidget {
  final Pais pais;
  const FichaPais({required this.pais}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.pais.nombre),
      ),
      body: Column(
        children: <Widget>[
          Image.asset("assets/banderas/" + this.pais.bandera),
          Text("Capital: " + this.pais.capital)
        ],
      ),
    );
  }
}
