import 'posto_de_saude.dart';
import 'entrepreneurs.dart';

class Favela{
  Favela({
    this.communityName,
    this.description,
    this.imageUrl,
    this.photoCredits,
    this.population,
    this.residences,
    this.totalCases,
    this.activeCases,
    this.recoveredCases,
    this.deaths,
    this.postosdesaude,
    this.favelaResident,
  });

  String communityName;
  String description;
  String imageUrl;
  String photoCredits;
  int population;
  int residences;
  int totalCases;
  int activeCases;
  int recoveredCases;
  int deaths;
  PostoDeSaude postosdesaude;
  FavelaResident favelaResident;
}


  List<Favela> favelas = [
    Favela(
      communityName: 'Andarai',
      description: 'Localizado no bairro de mesmo nome, o complexo que compõe'
          ' a UPP Andaraí se estende até o bairro do Grajaú'
          'e é formado pelos morros do Andaraí, Arrelia, Jamelão, Nova '
          'Divineia, João Paulo II, Juscelino Kubitschek e Vila Rica. '
          'A ocupação da área teve início na década de 1930, nas encostas da Serra do Andaraí, '
          'mas a história da ocupação da região confunde-se com a história dos bairros do entorno.'
          ' Até o século XVII, toda a área era repleta de sítios e fazendas destinados à produção agrícola.'
          ' Em meados do século XIX, a produção agrícola entrou em declínio e as propriedades rurais foram '
          'loteadas e vendidas. Uma das primeiras ruas abertas durante esse período foi a Borda do Mato, '
          'onde está localizada a comunidade Vila Rica, a primeira a ser ocupada na área. A UPP Andaraí é a décima primeira estado.'
          ' Ela foi inaugurada em 28 de julho de 2010. UPP Social chegou oficialmente em 23 de setembro de 2011',
      population: 9695,
      residences: 2693,
      activeCases: 4,
      deaths: 0,
      imageUrl: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/favelaAndarai_MarceloHorn.jpg',
      photoCredits: 'Marcelo Horn',
    ),
    Favela(
      communityName: 'Borel',
      description: 'A ocupação da região começou na década de 1920. A área era conhecida por sua mata densa '
          'e pela concentração de muitas nascentes. Uma das possíveis origens do nome da comunidade é a antiga '
          'fábrica de fumos e rapé Borel & Cia, que funcionava bem perto do morro. O símbolo da empresa, um pavão-real azul'
          ' e amarelo-ouro, que vinha estampado nos maços de cigarro, acabou virando o símbolo da Escola de Samba Unidos da Tijuca,'
          ' fundada 1931. Foi no Borel que surgiu a primeira organização coletiva de moradores de favela, a União de Trabalhadores Favelados,'
          ' em 1954. Além do Morro do Borel, compõem a área da UPP as comunidades de Indiana, Morro do Cruz, Bananal, Casa Branca, '
          'Chácara do Céu e Catrambi. A UPP Borel foi a 8a. Unidade de Polícia Pacificadora a ser inaugurada, em 7 de junho de 2010. '
          'O fórum que instalou o Programa Rio+Social (então chamado de UPP '
          'Social) na região foi realizado em 17 de julho de 2011.',
      population: 12811,
      residences: 3734,
      activeCases: 1,
      deaths: 0,
      imageUrl: 'images/Borel.jpeg'
    ),
    Favela(
      communityName: 'Cidade de Deus',
      description: 'A região pertencia à Grande Sesmaria de Martin de Sá, que se estendia do arroio Pavuna até o Maciço da Tijuca,'
          ' e cuja principal construção era o Engenho D’Água. Posteriormente, a área foi ocupada por sítios e fazendas onde cultivou-se '
          'cana-de-açúcar, café e lavouras diversas. Na década de 1960, com a transformação do Distrito Federal em Estado da Guanabara, '
          'o Governador Carlos Lacerda implementou uma política de remodelação da zona sul da Cidade, promovendo a construção de grande '
          'conjunto habitacional na baixada de Jacarepaguá. Surgiu assim a Cidade de Deus. Construída pela Cohab e financiada pelo Banco '
          'Nacional da Habitação (BNH), a Cidade de Deus terminou de ser construída após o governo Negrão de Lima tendo seus projetos '
          'executados em 1968. As pessoas transferidas para a Cidade de Deus provinham de 63 favelas distintas, sendo que 70% vinha de'
          ' apenas seis favelas: Praia do Pinto, Parque da Gávea, Ilha das '
          'Dragas, Parque do Leblon, Catacumba e Rocinha. ',
      population: 47795,
      residences: 14742,
      activeCases: 8,
      recoveredCases: 0,
      deaths: 1,
      imageUrl: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/favelaCidadededeus.jpg'
    ),
    Favela(
      communityName: 'Complexo da Maré',
      description: 'Toda a região da Maré era ocupada por pântanos e manguezais junto à orla da Baía de Guanabara e abrangia vários acidentes geográficos'
          ' que desapareceram com os sucessivos aterros. O termo “Maré” tem origem no fenômeno natural que afligia os moradores das palafitas que ocuparam a região.'
          ' A mais antiga das comunidades que compõem o chamado “Complexo da Maré” é o Morro do Timbau, cuja ocupação se iniciou em 1940. A expansão do Timbau surgiu '
          'sobre palafitas no manguezal contínuo ao morro, na localidade conhecida como Baixa do Sapateiro, datada de 1947. Na década de 1950 surgiram as comunidades '
          'Parque Maré, uma expansão sobre palafitas da Baixa do Sapateiro, e Parque Roquete Pinto, uma série de aterros sobre um manguezal no final da Rua Ouricuri '
          'junto à Baía. Na década de 1960, surgem as comunidades de Parque Rubens Vaz, Parque União, Parque Nova Holanda e Praia de Ramos. Em 1982, é implementado '
          'o “Projeto Rio”, grande intervenção pública para reassentar os moradores das palafitas em conjuntos habitacionais. Tais conjuntos foram erguidos sobre '
          'aterros dos manguezais do antigo saco de Inhaúma e da Ilha do Pinheiro. Os principais conjuntos habitacionais do Complexo da Maré são Vila Do João (1982),'
          ' Conjunto Esperança (1982), Vila Do Pinheiro (1983), Conjunto Pinheiro (1989), Conjunto Bento Ribeiro Dantas (1992), Conjunto Nova Maré (1996) e '
          'Salsa e Merengue (2000), oficialmente, denominada Novo Pinheiro. O Bairro da Maré foi criado, delimitado e codificado pela Lei Nº 2119, de 19 de janeiro de 1994, '
          'com alterações nos limites de bairros de Olaria, Ramos, Bonsucesso'
          ' e Manguinhos. ',
      population: 129770,
      residences: 41759,
      activeCases: 1,
      deaths: 0,
      recoveredCases: 0,
      totalCases: 1
    ),
    Favela(
      communityName: 'Complexo da Penha',
      description: 'O Complexo da Penha, na Zona Norte do Rio, é formado pelos complexos do Grotão, na Região Administrativa (RA) da Penha, e da Vila Cruzeiro, na RA de Olaria. '
          'A Vila Cruzeiro, que abrange a Vila Proletária da Penha, o Morro do Cariri e a Rua Laudelino Freire, foi ocupada durante a década de 1940. '
          'Seu nome se deve a uma cruz que havia no alto do morro. A Vila Proletária da Penha surge em 1941. Em 1946, se mudam para lá moradores removidos de uma área '
          'conhecida como Mamona, na região do Cais do Porto. A região recebeu também moradores vindos do antigo Morro da Favela e do Beco do Saci, em São Cristóvão, '
          'e do Parque Arara, no Caju. O Parque Proletário do Grotão, composto pelo Morro da Caixa D’água, foi ocupado em 1979, após a falência da Pedreira Elcatroni,'
          ' dona da região. Moradores dos morros do entorno se mudaram para a área mais plana do local. As UPPs Chatuba e Fé/Sereno foram inauguradas em 27 de junho de 2012.'
          ' O Fórum UPP Social foi realizado em 20 de julho de 2012. ',
      population: 48559,
      residences: 13060,
      activeCases: 5,
      deaths: 1,
      recoveredCases: 2,
      totalCases: 8,
      imageUrl: 'images/favelaPenha_SalvadorScofano.jpg',
      photoCredits: 'Salvador Scofano'
    ),
    Favela(
      communityName: 'Rocinha',
      description: 'A Rocinha tem status de bairro desde 1993. Localizada entre Gávea e São Conrado, ela é vizinha do morro do Vidigal, na Zona Sul da cidade. '
          'A Rocinha é hoje uma das maiores favelas da América latina e tem mais moradores que 92% dos municípios brasileiros, com 69.191 habitantes. '
          'Deste total, ¼ são crianças e 32% tem idade entre 15 e 29 anos de idade. Ou seja, a Rocinha é jovem. Estima-se seu surgimento em meados da '
          'década de 30, entre barracos e lavouras. Os moradores viviam basicamente da agricultura de suas roças, cujos produtos eram vendidos na '
          'feira da Praça Santos Dumond, na Gávea. Sempre diziam que plantavam em sua pequena terra, em sua “rocinha”. Daí surgiu o nome. A favela, '
          'que se encontra em uma Área de Especial interesse Social, instituída por lei em 2001, já recebeu recursos do Programa de Aceleração do Crescimento '
          'e fora incluída no âmbito da Fase 3 do Programa Morar Carioca. A '
          'UPP Rocinha foi inaugurada em 20 de setembro de 2012. ',
      population: 71080,
      residences: 23970,
      activeCases: 24,
      deaths: 2,
      recoveredCases: 0,
      totalCases: 26,
      imageUrl: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/favelaRocinha.jpg',
    ),
  ];






//Fazer mapa do COVID-19 nas favelas do município do Rio de Janeiro*
//- Total de casos, casos ativos, casos recuperados e casos fatais (Por favela) DONE
//- Percentual de casos ativos, casos recuperados e casos fatais (favela x asfalto) - Output
//- Mapa mostrará também o nível da proliferação nas favelas com classificação: alta, média e baixa (número de moradores/casos ativos)**
//
//*Mapa com data e hora da última atualização
//**Esse dado será utilizado para o tomador de decisão decidir quais favelas terão prioridade no recebimento de doações.

// Source de dados dos postos de saude: https://www.rio.rj.gov.br/web/sms/exibeconteudo?id=4206759


class Asfalto {
  Asfalto({
    this.nomeBairro,
    this.populacao,
    this.totalDeCasos,
    this.casosAtivos,
    this.casosRecuperados,
    this.mortes,
  });

  String nomeBairro;
  int populacao;
  int totalDeCasos;
  int casosAtivos;
  int casosRecuperados;
  int mortes;
}


