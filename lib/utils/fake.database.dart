import 'models.dart';

List<Package> fixturesPackages = [
  Package('plane', 'state', 'N°QRVG325617'),
  Package('boat', 'state', 'N°QRVG325618'),
];

List<Country> fixtureCountries = [
  Country("Sénégal", "senegal.png"),
  Country("France", "france.png"),
];

List<TypeShipment> fixturesTypeShipments = [
  TypeShipment(
      'Eco', 'Délais compris entre 6 et 8 jours ouvrés 1 départ par semaine'),
  TypeShipment('Light',
      'Délais compris entre 4 et 6 jours ouvrés 2 départs par semaine'),
  TypeShipment('Express',
      'Délais compris entre 2 et 4 jours ouvrés 3 départ par semaine')
];
