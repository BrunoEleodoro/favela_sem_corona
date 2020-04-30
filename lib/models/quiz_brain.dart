class Question {
  Question({
    this.questionText,
    this.questionAnswer,
    this.questionImage,
    this.possibleAnswers,
    this.note = '',
  });

  String questionText;
  int questionAnswer;
  String questionImage;
  List<String> possibleAnswers;
  String note;
}

class QuizBrain {
  int questionNumber = 0;

  List<Question> questions = [
    Question(
        questionText:
            'Não existe um medicamento para a COVID-19, por isso as pessoas não se curam.',
        questionAnswer: 1,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/stickers_fsc08.gif',
        possibleAnswers: ['Verdadeiro', 'Falso'],
        note:
            'Nota: Apesar de não haver medicamentos para o vírus e só se tratarem os sintomas, muitos dos doentes infectados ficam curados em poucas semanas'),
    Question(
        questionText:
            'No nome "COVID-19", "COVI" significa coronavírus, "D" doença e "19" é o ano em que foi detectada pela primeira vez (2019)',
        questionAnswer: 0,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/stickers_fsc07.gif',
        possibleAnswers: ['Verdadeiro', 'Falso'],
        note:
            'Nota: O vírus apareceu pela primeira vez em Dezembro de 2019, na China'),
    Question(
        questionText: 'Os antibióticos existem para combater vírus',
        questionAnswer: 1,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/stickers_fsc06.gif',
        possibleAnswers: ['Verdadeiro', 'Falso'],
        note:
            'Nota: Os antibióticos combatem bactérias, não vírus, e devem ser usados apenas por indicação médica.'),
    Question(
        questionText: 'Escolha a frase correta:',
        questionAnswer: 0,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/stickers_fsc05.gif',
        possibleAnswers: [
          'Os sintomas da COVID-19 são semelhantes aos sinais e sintomas de uma gripe (febre, tosse, dificuldade respiratória, dores no corpo e cansaço',
          'Os sinais e sintomas da COVID-19 são muito diferentes de uma gripe'
        ],
        note:
            'Nota: Como os sinais e sintomas são semelhantes, só uma análise pode comprovar se estamos infetados ou não com o novo coronavírus.'),
    Question(
        questionText: 'As lives do grupo Favela Sem Corona ocorrem:',
        questionAnswer: 1,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/stickers_fsc11.gif',
        possibleAnswers: [
          'Às Segundas-feiras às 8:00h da manhã no canal do Facebook',
          'Todas as Terças e Sextas-feiras às 19:00 no canal do Instagram',
          'Eventualmente, conforme achamos necessário'
        ],
        note:
            'Nota: Todas as semanas, às Terças e às Sextas-Feiras às 19:00 na nossa página do Instagram trazemos a vocês os melhores experts e pessoas interessantes para engajarmos nossas comunidades para diminuir o impacto do COVID-19. Participe! '),
    Question(
        questionText:
            'O coronavírus SARS-CoV-2 é um vírus novo, que apareceu pela primeira vez em dezembro de 2019, numa região da China. Isto significa que:',
        questionAnswer: 0,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/stickers_fsc03.gif',
        possibleAnswers: [
          'Como é novo, ainda estamos estudando o comportamento do vírus',
          'Apesar de ser novo, já sabemos tudo sobre o comportamento do vírus'
        ],
        note:
            'Nota: Como o vírus é novo, há muitas questões que ainda estão sendo estudadas. Há coisas que se sabem hoje sobre o vírus, mas que com os estudos podem mudar no futuro'),
    Question(
        questionText: 'De que forma podemos ficar infectados com o SARS-CoV-2?',
        questionAnswer: 1,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/stickers_fsc09.gif',
        possibleAnswers: [
          'Estando a cerca de 20 metros de uma pessoa infectada',
          'Através de gotículas liberadas pela fala, tosse ou espirro de uma pessoa infectada'
        ],
        note:
            'Nota: Estas gotículas, normalmente, não se projetam a distâncias superiores a um metro.'),
    Question(
        questionText:
            'Como é que se tem certeza se estamos infectados com o coronavírus SARS-CoV-2?',
        questionAnswer: 1,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/stickers_fsc10.gif',
        possibleAnswers: [
          'Se tivermos febre, tosse e dificuldade em respirar, estamos com certeza infectados',
          'Só através de uma análise positiva'
        ],
        note:
            'Nota: Podemos ter febre, tosse e dificuldade em respirar, e não estarmos infectados pelo vírus, pois há muitas doenças que têm esses sintomas. Só uma análise feita no hospital de referência comprova que estamos infectados.'),
    Question(
        questionText:
            'Se borrifar o corpo em álcool consigo evitar ser contagiado?',
        questionAnswer: 1,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/stickers_fsc02.gif',
        possibleAnswers: ['Sim', 'Não'],
        note:
            'Nota: Borrifar o corpo com álcool não tem qualquer efeito na prevenção, e até pode ser perigoso, se atingir seus olhos ou a boca.'),
    Question(
        questionText:
            'Quem estiver infectado deve usar máscara de proteção respiratória?',
        questionAnswer: 0,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/mask.png',
        possibleAnswers: ['Sim', 'Não'],
        note: 'Nota: Para evitar o contágio de outras pessoas'),
    Question(
        questionText: 'Este vírus (o SARS-CoV-2) é o mais grave que se conhece',
        questionAnswer: 1,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/stickers_fsc11.gif',
        possibleAnswers: ['Verdadeiro', 'Falso'],
        note:
            'Nota: Este vírus ainda está em estudo. A esmagadora maioria das pessoas que contraiu a doença fica curada.'),
    Question(
        questionText: 'O coronavírus SARS-CoV-2 é:',
        questionAnswer: 2,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/stickers_fsc12.gif',
        possibleAnswers: [
          'Um vírus que já existe há muitos séculos no ser humano',
          'Um vírus que ainda não se sabe se é novo ou não',
          'Um vírus novo que afeta o ser humano'
        ],
        note:
            'Nota: É por esta razão que ainda se estuda o vírus, para que se possa conhecer melhor e se possa tratar das pessoas infectadas.'),
    Question(
        questionText:
            'O que significa quando se diz que alguém deve ficar em "isolamento social", porque está doente (com COVID-19) ou pode estar infectado?',
        questionAnswer: 0,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/stickers_fsc01.gif',
        possibleAnswers: [
          'Significa que se deixa de participar em atividades sociais em grupo, como trabalhar e estudar; ou de entretenimento, como ir à praia, parque ou shopping centers, etc',
          'Significa que se pode ter uma vida normal, desde que se coloque uma máscara, para não infectar os outros'
        ],
        note: ''),
    Question(
        questionText:
            'Os doentes com COVID-19 desenvolvem muitas vezes pneumonia. O que é uma pneumonia?',
        questionAnswer: 0,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/person1.jpg',
        possibleAnswers: [
          'Uma inflamação dos pulmões',
          'Uma inflamação dos olhos',
          'Uma inflamação do estômago'
        ],
        note:
            'Nota: A pneumonia pode ter várias origens, nem sempre é grave, e a grande maioria das pessoas se recupera com os tratamentos.'),
    Question(
        questionText:
            'Se sentir sintomadas associados ao COVID-19, como febre e tosse, devo ficar em casa em "isolamento social" e ligar para 136',
        questionAnswer: 0,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/stickers_fsc12.gif',
        possibleAnswers: ['Verdadeiro', 'Falso'],
        note:
            'Nota: Deve-se ligar para o 136, para que nos indiquem o que devemos fazer'),
    Question(
        questionText:
            'O SARS-CoV-2 pode ser transmitido por picadas de insetos, como mosquitos?',
        questionAnswer: 1,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/todos.png',
        possibleAnswers: ['Sim', 'Não'],
        note:
            'Nota: Os estudos desenvolvidos até hoje não indicam que haja tal possibilidade.'),
    Question(
        questionText:
            'A Organização Mundial da Saúde não aconselha o uso generalizado da máscara pelas populações.',
        questionAnswer: 0,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/mask.png',
        possibleAnswers: ['Verdadeiro', 'Falso'],
        note:
            'Nota: Houve uma mudança de estratégia e hoje em dia recomenda-se o uso generalizado da máscara por pessoas saudáveis. Porém, uma máscara mal colocada nāo funciona, e se for mal retirada (por exemplo, colocando as mãos na frente da máscara), também pode ajudar à propagação do vírus.'),
    Question(
        questionText:
            'Os vírus são pequenos agentes infecciosos responsáveis por muitas e diferentes doenças, e só são visíveis através de microscópios potentes.',
        questionAnswer: 0,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/virus1.png',
        possibleAnswers: ['Verdadeiro', 'Falso'],
        note:
            'Nota: Há vírus de diversos tamanhos, mas todos são muito pequenos para poderem ser vistos a olho nu'),
    Question(
        questionText:
            'A boca é uma porta de entrada de diversos vírus e agentes patogênicos, pelo que a escovagem correta dos dentes deve ser feita pelo menos duas vezes por dia.',
        questionAnswer: 0,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/stickers_fsc05.gif',
        possibleAnswers: ['Verdadeiro', 'Falso'],
        note: ''),
    Question(
        questionText:
            'Pessoas com doenças crônicas são mais facilmente afetadas pelo coronavírus SARS-CoV-2. O que é uma doença crônica?',
        questionAnswer: 2,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/stickers_fsc07.gif',
        possibleAnswers: [
          'É uma doença que é rapidamente resolvida',
          'É uma doença que afeta só os pulmões',
          'É uma doença que nāo é rapidamente resolvida, e que pode nos afetar durante meses, anos ou a vida toda'
        ],
        note:
            'Nota: Doenças crônicas são, por exemplo, a diabetes, certos tipos de câncer ou a hipertensão (tensão alta). Pessoas com estas doenças são mais vulneráveis a outras doenças, como esta provocada pelo SARS-CoV-2'),
    Question(
        questionText: 'Já existe vacina para o coronavírus SARS-CoV-2',
        questionAnswer: 1,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/stickers_fsc08.gif',
        possibleAnswers: ['Verdadeiro', 'Falso'],
        note:
            'Nota: A vacina ainda está sendo desenvolvida por vários países, mas ainda deve demorar alguns meses para ficar pronta e ser aplicada na população em geral.'),
    Question(
        questionText: 'Como ocorre a transmissão do coronavírus SARS-CoV-2?',
        questionAnswer: 2,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/person1.jpg',
        possibleAnswers: [
          'Por gotículas, projetadas normalmente através da fala, tosse ou espirros',
          'Por contato com objetos contaminados',
          'Ambas as opções estão corretas'
        ],
        note:
            'Nota: Quando você espirra ou tosse, deverá tapar o nariz e a boca com o cotovelo ou com um lenço de papel, que deverá ser descartado imediatamente no lixo'),
    Question(
        questionText:
            'Depois de tocar num animal, pode-se levar a mão à boca, nariz ou olhos',
        questionAnswer: 1,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/dogcovid.jpg',
        possibleAnswers: ['Verdadeiro', 'Falso'],
        note: 'Nota: Deve-se lavar sempre as mãos depois de tocar em animais.'),
    Question(
        questionText:
            'É verdade que o COVID-19 afeta principalmente pessoas idosas e com doenças crônicas?',
        questionAnswer: 1,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/stickers_fsc03.gif',
        possibleAnswers: ['Sim', 'Não'],
        note:
            'Nota: O vírus que origina a COVID-19 afeta pessoas de todas as idades. No entando, os dados que existem até o momento mostram que pessoas idosas e com doenças crônicas são um grupo de risco. Em caso de contágio, poderão ter consequências mais graves para a sua saúde.'),
    Question(
        questionText:
            'Quem estiver infectado deve usar máscara de proteção respiratória?',
        questionAnswer: 0,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/stickers_fsc12.gif',
        possibleAnswers: ['Sim', 'Não'],
        note: 'Nota: Para evitar o contágio de outras pessoas.'),
    Question(
        questionText:
            'Qual a distância mínima a que devo estar de outra pessoa, para não ser infectado pelo SARS-CoV-2?',
        questionAnswer: 2,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/stickers_fsc01.gif',
        possibleAnswers: [
          'Cerca de 10 metros',
          'Cerca de 5 metros',
          'No mínimo, 2 metros'
        ],
        note: 'Nota: No mínimo 2 metros.'),
    Question(
        questionText:
            'Alguns vírus podem ser transmitidos por animais aos seres humanos',
        questionAnswer: 0,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/dogcovid.jpg',
        possibleAnswers: ['Sim', 'Não'],
        note:
            'Nota: Existem vírus que podem ser transmitidos por animais domésticos aos seres humanos, como é o caso do da raiva. Mas, até agora não se provou que o coronavírus SARS-CoV-2 possa ser transmitido pelos nossos animais domésticos.'),
    Question(
        questionText: 'Qual destas frases é verdadeira?',
        questionAnswer: 0,
        questionImage: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/stickers_fsc05.gif',
        possibleAnswers: [
          'A vacinação é importante, porque previne o aparecimento de muitas doenças',
          'A vacinação não é muito importante, pois raramente é eficaz.'
        ],
        note:
            'Nota: O Brasil tem um Programa Nacional de Vacinação, que deve ser seguido, e que abrange muita vacinas, como contra difteria, tétano, o sarampo, coqueluche, etc'),
  ];

  void nextQuestion() {
    if (questionNumber < questions.length - 1) {
      questionNumber++;
    }
    // print(questionNumber);
    // print(questions.length);
  }

//  Expanded(
//  child: Padding(
//  padding: EdgeInsets.all(15),
//  child: FlatButton(
//  textColor: Colors.white,
//  color: Colors.green,
//  child: Text('FATO', style: TextStyle(color: Colors.white, fontSize: 20.0),),
//  onPressed: (){
//  checkAnswer(0);
//  },
//  ),
//  ),
//  ),
//

  String getQuestionText() {
    return questions[questionNumber].questionText;
  }

  List<String> getPossibleAnswers() {
    return questions[questionNumber].possibleAnswers;
  }

  bool getCorrectAnswer(answer) {
    return questions[questionNumber].questionAnswer == answer;
  }

  bool isFinished() {
    if (questionNumber >= questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    questionNumber = 0;
  }
}
