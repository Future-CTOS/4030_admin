enum VehicleType {
  allVehicleType('allVehicle', 'وسیله نقلیه'),
  car('car', 'ماشین'),
  van('van', 'وانت'),
  motoCycle('motorcycle', 'موتور');

  final String title;
  final String value;

  const VehicleType(this.value, this.title);
}
