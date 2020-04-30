
class PostoDeSaude {

  PostoDeSaude({
    this.nome,
    this.endereco,
    this.telefone,
    this.horariosDeFuncionamento,
    this.lat,
    this.lng,
  });

  String nome;
  String endereco;
  String telefone;
  List<String> horariosDeFuncionamento;
  double lat;
  double lng;
  int totalDeMedicos;

  String createSnippet(){
    String snippet;
    snippet = endereco+"\n";
    snippet += telefone+"\n";

    return snippet;
  }

}

List<PostoDeSaude> postosdesaude = [
  PostoDeSaude(
    nome: 'UPA Rocinha',
    endereco: 'Estrada da Gávea, 520 (curva do S) - Rocinha',
    telefone: '3322-7190',
    lat: -22.9892591,
    lng: -43.2542239,
    horariosDeFuncionamento: ['24 horas'],
  ),
  PostoDeSaude(
    nome: 'UPA Alemão',
    endereco: 'Estrada Itararé, 951 - Ramos',
    telefone: '3881-1656',
    lat: -22.865045,
    lng: -43.2705581,
    horariosDeFuncionamento: ['24 horas'],
  ),
  PostoDeSaude(
    nome: 'UPA Manguinhos',
    endereco: 'Av. Dom Helder Câmara, 1390 - Manguinhos',
    telefone: '2332-2405 / 2332-2408',
    lat: -22.8857398,
    lng: -43.2532465,
    horariosDeFuncionamento: ['24 horas'],
  ),
  PostoDeSaude(
    nome: 'UPA Engenho de Dentro',
    endereco: 'Rua Bernardo, s/n - Engenho de Dentro',
    telefone: '2592-0502',
    lat: -22.9035035,
    lng: -43.3027732,
    horariosDeFuncionamento: ['24 horas'],
  ),
  PostoDeSaude(
    nome: 'UPA Madureira',
    endereco: 'Praça dos Lavradores, s/n - Campinho',
    telefone: '3358-2994',
    lat: -22.882234,
    lng: -43.3469191,
    horariosDeFuncionamento: ['24 horas'],
  ),
  PostoDeSaude(
    nome: 'UPA Costa Barros',
    endereco: 'Estrada Botafogo, s/n - Costa Barros',
    telefone: '2508-6990',
    lat: -22.8217632,
    lng: -43.3709838,
    horariosDeFuncionamento: ['24 horas'],
  ),
  PostoDeSaude(
    nome: 'UPA Rocha Miranda',
    endereco: 'Estrada do Barro Vermelho, s/n - Rocha Miranda',
    telefone: '3015-6259',
    lat: -22.851331,
    lng: -43.348782,
    horariosDeFuncionamento: ['24 horas'],
  ),
  PostoDeSaude(
    nome: 'UPA Cidade de Deus',
    endereco: 'Rua Edgar Werneck, s/n - Cidade de Deus',
    telefone: '2232-3173',
    lat: -22.947204,
    lng: -43.361688,
    horariosDeFuncionamento: ['24 horas'],
  ),
  PostoDeSaude(
    nome: 'UPA Vila Kennedy',
    endereco: 'Praça Dolomitas, s/n - Vila Kennedy',
    telefone: '2405-0303 / 2405-0447',
    lat: -22.8549106,
    lng: -43.4946111,
    horariosDeFuncionamento: ['24 horas'],
  ),
  PostoDeSaude(
    nome: 'UPA Senador Camará',
    endereco: 'Av. Santa Cruz, 6486 - Senador Camará',
    telefone: '3839-3688 / 3839-5847',
    lat: -22.882471,
    lng: -43.485547,
    horariosDeFuncionamento: ['24 horas'],
  ),
  PostoDeSaude(
    nome: 'UPA Magalhães Bastos',
    endereco: 'Estrada Manoel Nogueira de Sá c/ Rua Professor José Rodrigues s/n - Magalhães Bastos',
    telefone: '3550-7080 / 2018-2525',
    lat: -22.8925313,
    lng: -43.4197684,
    horariosDeFuncionamento: ['24 horas'],
  ),
  PostoDeSaude(
    nome: 'UPA Sepetiba',
    endereco: 'Rua José Fernandes, s/n - Alagados - Sepetiba',
    telefone: '3404-7250',
    lat: -22.974701,
    lng: -43.695961,
    horariosDeFuncionamento: ['24 horas'],
  ),
  PostoDeSaude(
    nome: 'UPA Santa Cruz',
    endereco: 'Avenida João XXIII, s/n (em frente ao CIEP Papa João XXIII) - Santa Cruz',
    telefone: '2416-5719',
    lat: -22.906854,
    lng: -43.706149,
    horariosDeFuncionamento: ['24 horas'],
  ),
  PostoDeSaude(
    nome: 'UPA Paciência',
    endereco: 'Estrada Santa Eugênia, s/n - Jardim 7 de Abril - Paciência',
    telefone: '3406-7697 / 3426-4410 / 3406-4790',
    lat: -22.9271677,
    lng: -43.6373378,
    horariosDeFuncionamento: ['24 horas'],
  ),
  PostoDeSaude(
    nome: 'CER Centro (Souza Aguiar)',
    endereco: 'Rua Frei Caneca, s/n (ao lado do n 52) - Centro',
    telefone: '2507-1311',
    lat: -22.9091266,
    lng: -43.1929243,
    horariosDeFuncionamento: ['24 horas'],
  ),
  PostoDeSaude(
    nome: 'CER Leblon (Miguel Couto)',
    endereco: 'Rua Mário Ribeiro, 1080 - Leblon',
    telefone: '2529-9200',
    lat: -22.9771588,
    lng: -43.2257906,
    horariosDeFuncionamento: ['24 horas'],
  ),
  PostoDeSaude(
    nome: 'CER Barra da Tijuca (Lourenço Jorge)',
    endereco: 'Av. Ayrton Senna, 2000 - Barra da Tijuca',
    telefone: '3870-3716',
    lat: -22.9947511,
    lng: -43.3675526,
    horariosDeFuncionamento: ['24 horas'],
  ),
  PostoDeSaude(
    nome: 'CER Ilha do Governador (Evandro Freire)',
    endereco: 'Estrada do Galeão, 2920 - Ilha do Governador',
    telefone: '3353-6179 / 3353-6135',
    lat: -22.804594,
    lng: -43.212893,
    horariosDeFuncionamento: ['24 horas'],
  ),
  PostoDeSaude(
    nome: 'CER Pedro II (Pedro II)',
    endereco: 'Rua do Prado, 325 Santa Cruz',
    telefone: '2419-4792 / 3313-2554 / 3365-5201',
    lat: -22.9126616,
    lng: -43.6898988,
    horariosDeFuncionamento: ['24 horas'],
  ),
  PostoDeSaude(
    nome: 'CER Realengo (Albert Schweitzer)',
    endereco: 'Rua Nilópolis, 239 - Realengo',
    telefone: '2233-6791',
    lat: -22.8666163,
    lng: -43.4415797,
    horariosDeFuncionamento: ['24 horas'],
  ),
  PostoDeSaude(
    nome: 'CER Campo Grande (Rocha Faria)',
    endereco: 'Av. Cesário de Melo, 3215 - Campo Grande',
    telefone: '2233-6791 / 2233-6797 / 2088-4500',
    lat: -22.9082524,
    lng: -43.5645782,
    horariosDeFuncionamento: ['24 horas'],
  ),
  PostoDeSaude(
    nome: 'Hospital Municipal Souza Aguiar',
    endereco: 'Praça da Republica, 111 - Centro',
    telefone: '3111-2600 / 3111-2611',
    lat: -22.908521,
    lng: -43.1923835,
    horariosDeFuncionamento: ['24 horas'],
  ),
  PostoDeSaude(
    nome: 'Hospital Municipal Salgado Filho',
    endereco: 'Rua Arquias Cordeiro, 370 - Méier',
    telefone: '3111-4100',
    lat: -22.9005873,
    lng: -43.2802058,
    horariosDeFuncionamento: ['24 horas'],
  ),
  PostoDeSaude(
    nome: 'Hospital Municipal Miguel Couto',
    endereco: 'Rua Mário Ribeiro, 117 - Leblon',
    telefone: '3111-3781',
    lat: -22.9775794,
    lng: -43.2262059,
    horariosDeFuncionamento: ['24 horas'],
  ),
  PostoDeSaude(
    nome: 'Hospital Municipal Lourenço Jorge',
    endereco: 'Avenida Ayrton Senna, 2000 - Barra da Tijuca',
    telefone: '3111-4652 / 3111-4653',
    lat: -22.9949884,
    lng: -43.3659493,
    horariosDeFuncionamento: ['24 horas'],
  ),
  PostoDeSaude(
    nome: 'Hospal Municipal Rocha Maia',
    endereco: 'Rua General Severiano, 91 - Botafogo',
    telefone: '2295-2295',
    lat: -22.9533986,
    lng: -43.1791515,
    horariosDeFuncionamento: ['24 horas'],
  ),
  PostoDeSaude(
    nome: 'Hospal Municipal Francisco da Silva Telles',
    endereco: 'Av. Ubirajá, 25 - Irajá',
    telefone: '3111-2011',
    lat: -22.8308383,
    lng: -43.3302707,
    horariosDeFuncionamento: ['24 horas'],
  ),
];

List<PostoDeSaude> clinicasDaFamiliaRocinha = [
  PostoDeSaude(
    nome: 'Clinica da Família - Maria do Socorro',
    endereco: 'Estrada da Gávea, 522 - Rocinha',
    telefone: '(21)3322-6694 / 97220-2793 / 99824-0927',
    horariosDeFuncionamento: ['De Segunda a Sexta das 08h às 20h', 'Sábado das 08h às 12h']
  ),
  PostoDeSaude(
      nome: 'Clinica da Família - Rinaldo de Lamare',
      endereco: 'Av. Niemeyer, 776 - São Conrado',
      telefone: '(21) 33242487 / 31111067 / 33225066',
      horariosDeFuncionamento: ['De Segunda a Sexta das 08h às 20h', 'Sábado das 08h às 12h']
  ),
  PostoDeSaude(
      nome: 'Clinica da Família - Albert Sabin',
      endereco: 'Estrada da Gávea, 522 - Rocinha',
      telefone: '(21) 3204-6088',
      horariosDeFuncionamento: ['De Segunda a Sexta das 07h às 17h', 'Sábado '
          'das 08h às 12h']
  )
];



