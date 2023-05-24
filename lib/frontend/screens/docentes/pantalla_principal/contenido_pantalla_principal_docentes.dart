import 'package:flutter/material.dart';

class ContenidoPantallaPrincipalDocentes extends StatelessWidget {
  const ContenidoPantallaPrincipalDocentes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/port.jpg'),
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
                SizedBox(width: 10),
                Image(
                  image: AssetImage('assets/port2.jpg'),
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
                SizedBox(width: 10),
                Image(
                  image: AssetImage('assets/port3.jpg'),
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(35),
              child: Text(
                'Nuestra institución concretó su nueva misión en los siguientes términos: “Formar lideres innovadores con equidad”, personas íntegras, éticas, con una visión humanística y competitivas, que al mismo tiempo estén comprometidos con el desarrollo económico, político, social y cultural de su comunidad y con el uso sostenible de los recursos naturales.',
                textAlign: TextAlign.justify,
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Misión'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Visión'),
                ),
              ],
            ),
            const ElevatedButton(
                onPressed: null, child: Text('Nuestros Docentes')),
            const SizedBox(height: 30),
            //reservar laboratorios boton
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                  Colors.yellow,
                ),
                foregroundColor: MaterialStatePropertyAll<Color>(
                  Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/laboratorios');
              },
              child: const Text('Reservar Laboratorios'),
            ),
          ],
        ),
      ),
    );
  }
}
