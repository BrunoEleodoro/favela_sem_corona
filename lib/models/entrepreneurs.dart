
class FavelaResident{
  FavelaResident({
    this.entrepreneurName,
    this.businessType,
    this.businessName,
    this.favela,
    this.email,
    this.instagramUrl,
    this.facebookUrl,
    this.phone,
    this.whatsApp,
});

  String entrepreneurName;
  String businessType;
  String businessName;
  String favela;
  String email;
  String instagramUrl;
  String facebookUrl;
  String phone;
  String whatsApp;
}

List<FavelaResident> rocinhaEntrepreneurs =[
  FavelaResident(
    entrepreneurName: 'Ale Dias',
    businessType: 'Food - Home Bakery',
    businessName: 'Ale Dias Bolos',
    favela: 'Rocinha',
    whatsApp: 'n/a',
    instagramUrl: '@alediasbolos'
  ),
  FavelaResident(
    entrepreneurName: 'Andressa',
    businessType: 'Food',
    businessName: 'n/a',
    favela: 'Rocinha',
    whatsApp: '+55(21)98507-4111',
  ),
  FavelaResident(
    entrepreneurName: 'XYZ',
    businessType: 'Food - Desserts',
    businessName: 'Cria Doces',
    whatsApp: '+55(21)97380-4957',
  ),
  FavelaResident(
    entrepreneurName: 'YYY',
    businessType: 'Food - Desserts',
    businessName: 'Duo Deleite',
    instagramUrl: '@Duo_deleite',
    facebookUrl: 'https://www.facebook.com/DuoDeleite/'
  ),
  FavelaResident(
    entrepreneurName: '000',
    businessType: 'Food - Vegan',
    businessName: 'Trevo Vegetariano',
    whatsApp: '+55(21)99480-0724',
    facebookUrl: 'https://facebook.com/bistrotrevovegetariano',
    instagramUrl: '@veganitinerante',
  ),
  FavelaResident(
    entrepreneurName: '999',
    businessType: 'Food - Desserts',
    businessName: 'Cone Trufado',
    whatsApp: '+55(21)99577-2723'
  ),
  FavelaResident(
    entrepreneurName: 'Lilica',
    businessType: 'Food',
    businessName: 'Delicia da Lilica',
    facebookUrl: 'https://www.facebook.com/deliciaslilicas',
  ),
  FavelaResident(
    entrepreneurName: 'Tulani',
    businessType: 'Food',
    whatsApp: '+55(21)99948-0559',
  ),
  FavelaResident(
    entrepreneurName: 'Thata',
    businessType: 'Food - Desserts',
    businessName: 'Doces Thata',
    whatsApp: '+55(21)97580-2490',
  ),
  FavelaResident(
    entrepreneurName: 'Bárbara',
    businessType: 'Food',
    businessName: 'Meu Querido Sabor',
    whatsApp: '+55(21)98081-7434',
    instagramUrl: '@meuqueridosabor',
  )
];

List<FavelaResident> andaraiEntrepreneurs = [
  FavelaResident(
    entrepreneurName: 'YYYUUU',
    businessName: 'Empreendedor Andaraí',
    businessType: 'Auto Mechanic',
    whatsApp: '+55(21)99999-1234'
  ),
  FavelaResident(
    entrepreneurName: 'Rosa',
    businessType: 'Hair Salon',
    businessName: 'Hair Salon Rosa Shine',
    whatsApp: 'not available'
  )
];