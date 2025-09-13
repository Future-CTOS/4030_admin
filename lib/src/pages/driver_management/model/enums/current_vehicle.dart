enum VehicleType {
  allVehicleType('allVehicle', 'وسیله نقلیه'),
  car('car', 'ماشین'),
  van('vanet', 'وانت'),
  motoCycle('motor', 'موتور');

  final String title;
  final String value;

  const VehicleType(this.value, this.title);
}
