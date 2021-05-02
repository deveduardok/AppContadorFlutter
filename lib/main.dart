//importamos todos os widgets relac ao material design e para rodar o runApp
import 'package:flutter/material.dart';

//todo proj começa com main,  e chamamos a funcao runApp
void main() {
  //criar um comando pra rodar o app, nosso app eh do tipo mat design e devemos especificar um obj materialApp, o title e home sao parametros do mat app
  runApp(MaterialApp(
//podemos colocar um titulo pro app, mas n vai aparecer em lugar nenhum, eh um param opcional
      title: 'Contador de pessoas',
//inves de container, vamos usar column: widget q permite colocarmos um widget em cima do outro na vertical
//na coluna posso colocar infinitos filhos, no botao apenas um.
      ///CRIANDO O STACK: passo os filhos
      ///VAMOS PASSAR NOSSO WIDGET STATEFUL NO home, CLASSE QUE ACABAMOS DE CRIAR
      home: Home()));
}

//CRIAÇÃO DO WIDGET STATEFUL
//VOU COLOCAR O NOME DO WIDGET : 'Home'. Criou classe Home
//colocar _HomeState e Home
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
//VOU CRIAR UMA VAR PEOPLE, COM _ PQ ELA SO PODE SER ACESSADA DE DENTRO DA CLASSE
  int _people = 0;
//VOU CRIAR UMA STRING PARA FALAR COMO ESTA A SITUAÇÃO DE ACORDO COM QTT DE PESSOAS
  String _infoText = 'Pode Entrar';
//CRIAR UMA NOVA FUNCAO privada(_), PÁRA MUDAR A VAR NA TELA, recebe delta
  void _changePeople(int delta) {
    setState(() {
      _people += delta;
//COLOCAR CONDIÇ PRA QTT DE PESSOAS
      if (_people < 0) {
        _infoText = 'Situação: NEGATIVO';
      } else if (_people <= 12) {
        _infoText = 'Situação: QUANTIDADE OK';
      } else {
        _infoText = 'Situação: LOTADO';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      //passando 1ºos widgets que ficam abaixo(image) dpois os de cima
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          //Neste caso é para preencher a tela inteira, msm cortando as bordas
          fit: BoxFit.cover,
          //altura
          height: 1000.0,
        ),
        Column(
          //colocar alinhado, no meio da tela
          mainAxisAlignment: MainAxisAlignment.center,
//passando pra coluna os widgets que quero colocar, poe children, filhos da coluna
//estilo recebeu: cor branca e fonte bold
//auto complete pode dar falha e sumir parenteses
          children: <Widget>[
            Text(
              //VOU MUDAR O TEXTO PARA ELE PEGAR A VAR PEOPLE
              'Controle do Nº de Clientes',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0),
            ),

            Text(
              //VOU MUDAR O TEXTO PARA ELE PEGAR A VAR PEOPLE
              'Qttd: $_people',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0),
            ),
//QUERO COLOCAR O BOTAO, SERA FILHO DA COLUNA, E PRA FICAR ENTRE OS TEXtOS, COLOCO AQUI. como obj da colunm
//precisamos colocar o param obrigatorios: child e onPressed
//filho do botao será um texto
//coluna será: texto, linha(2 botoes) e texto >> vamos criar a linha[row]

            Row(
//alinhamento da linha
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Inves de add flat button direto, vou add um PADDING. É preciso fornecer um padding(espaços)
                //FAÇO 2 PADDING PRA CADA PBOTAO, SO MUDANDO O +1 E -1
                Padding(
                  //Vou colocar um espaço igual para os 4 lados. depois vou especif o filho(child) e coloco o botao dentro dele
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      child: Text('+1',
                          style: TextStyle(
                              fontSize: 42.0,
                              color: Colors.lightGreen,
                              fontWeight: FontWeight.bold)),
                      //onPressed eh uma funcao que o botao vai chamar qd pressionado, colocando uma funcao anonima
                      //VAMOS COLOCAR FUNCIONALIDADES NO BOTAOO, veja q eh uma func anonima, como uma func normal, mas esta criando ai dentro
                      onPressed: () {
                        _changePeople(1);
                      }),
                ),
                Padding(
                  //vou colocar um espaço igual para os 4 lados. depois vou especif o filho(child) e coloco o botao dentro dele
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      child: Text('-1',
                          style: TextStyle(
                              fontSize: 42.0,
                              color: Colors.red,
                              fontWeight: FontWeight.bold)),
                      //onPressed eh uma funcao que o botao vai chamar qd pressionado, colocando uma funcao anonima
//VAMOS COLOCAR FUNCIONALIDADES NO BOTAOO, veja q eh uma func anonima, como uma func normal, mas esta criando ai dentro
                      onPressed: () {
                        _changePeople(-1);
                      }),
                ),
              ],
            ),

            //copiamos o de cima pra colocar mais um texto, inves de bold, italico
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
      ],
    );
  }
}
