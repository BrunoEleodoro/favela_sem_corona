import 'package:favelasemcorona/constants.dart';
import 'package:favelasemcorona/screens/useful_info_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';


void main() => runApp(MaterialApp(home: IMLScreen()));

class IMLScreen extends StatefulWidget {
  static const String id = 'iml_screen';

  @override
  _IMLScreenState createState() => _IMLScreenState();
}

class _IMLScreenState extends State<IMLScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nearlyWhite,
        appBar: AppBar(
          brightness: Brightness.light,
          title: Center(child: Text('Assistência Funerária')),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.grey.shade700,
                  ],
              ),
            ),
        ),),


        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Text(
                'Sepultamento Gratuito - Orientações \n '
                '\n'
                'Referente a sua consulta sobre a gratuidade de sepultamento, informamos que houve recomendação da ANVISA sobre o assunto e que a Defensoria Pública emitirá recomendação às concessionárias \n'
                'e aos Municípios reforçando a orientação de que a gratuidade do sepultamento permanece com as concessionárias e com os municípios. \n'
                '\n'
                'Portanto, não é necessário de ofício da Defensoria para a obtenção da gratuidade para sepultamento, pois a análise da solicitação\n'
                    'permanece com as concessionárias do serviço e com os municípios.\n'
                'Caso a gratuidade seja negada o assistido pode entrar em contato conosco, para ser encaminhado ao serviço de urgência da Defensoria Pública. \n'
                '\n'
                'Atualmente existem duas novas empresas (consórcios) administrando os cemitérios públicos do RJ, \n'
                'a RIO PAX e a REVIVER. \n'
                '\n'
                'CONSÓRCIO RIO PAX\n'
                'Administra os cemitérios do Lote 2 e tem serviço funerário próprio.\n'
                '\n'
                'Campo Grande\n'
                'Inhaúma\n'
                'Irajá\n'
                'Jacarepaguá\n'
                'Piabas\n'
                'São João Batista\n'
                '\n'
                'CONSÓRCIO REVIVER\n'
                'Administra os cemitérios públicos do Lote 1 e também possui serviço funerário para atendimento ao público.\n'
                'Ilha do Governador\n'
                'Paquetá\n'
                'Realengo\n'
                'Ricardo de Albuquerque\n'
                'São Francisco Xavier\n'
                'Santa Cruz\n'
                'Guaratiba\n'
                'Crematório São Francisco Xavier\n'
                '\n'
                'OBS: O Pedido pode ser feito completo, ou seja: GRATUIDADE PARA SERVIÇO FUNERÁRIO (caixão, remoção) e\n'
                'PARA O SERVIÇO CEMITERIAL (aluguel de capela, de jazigo e demais tarifas cemiteriais).\n'
                '\n'
                'Documentos Necessários (ORIGINAL E CÓPIA) para pleitar a gratuidade de sepultamento: \n'
                '- Certidão de Nascimento ou Casamento (Caso o usuário seja divorciado ou separado judicialmente,\n'
                ' deverá apresentar a certidão de casamento com a averbação) \n'
                '- RG ou Carteira Profissional \n'
                '- CPF \n'
                '- Comprovante de renda para que seja verificado o direito à gratuidade de justiça \n'
                '– Art. 34 da Deliberação CS 88/2012\n'
                'São documentos hábeis a comprovação de renda, a escolha do assistido:\n'
                'I - Contracheque; ou\n'
                'II - Carteira Profissional; ou\n'
                'III - Declaração de próprio punho do empregador ou do sindicato profissional, devidamente subscrita; e\n'
                'Para comprovar sua condição de hipossuficiente, além da apresentação de um dos documentos acima mencionados,\n'
                'o assistido deverá, obrigatoriamente, apresentar cópia de sua última declaração de Imposto de Renda, \n'
                'caso a tenha entregue.\n'
                'Obs: a obrigatoriedade da apresentação da última Declaração do Imposto de Renda foi estabelecida após \n'
                'realização de reunião da Coordenação dos Núcleos com o Defensores Públicos dos Núcleos de 1º atendimento \n'
    '(email da Dra. Fátima Saraiva do dia 24/01/2014) \n'
    '- Comprovante de residência em seu nome – Art. 37 § 2° da Deliberação CS 88/2012 \n'
    '\n'
    'São documentos hábeis a comprovação do domicílio, a escolha do assistido:\n'
    '\n'
    'I - Contas emitidas por concessionários de serviços públicos datadas de até três meses;\n'
    'II - Qualquer correspondência de empresas privadas e/ou órgãos públicos, datada de até três meses;\n'
    'III - Declaração da Associação de Moradores datada de até três meses;\n'
    'IV - Contratos de aluguel vigente;\n'
    'V - Declaração e/ou com cópia de identidade do declarante, desde que acompanhada de um dos documentos previstos'
    ' nas alíneas anteriores exigidos pelo Defensor Público, que avaliará os casos excepcionais, decidindo sobre'
    ' a viabilidade do atendimento.\n'
    '- Identidade do falecido\n'
    '- CPF do falecido\n'
    '- Comprovante de residência do falecido\n'
    '- Declaração de óbito\n'
    '\n'
    '\n'
    'Central de Relacionamento com o Cidadão – CRC\n'
    'Defensoria Pública do Estado do Rio de Janeiro '
    '\nTel: 129',

    ))));
  }
}
