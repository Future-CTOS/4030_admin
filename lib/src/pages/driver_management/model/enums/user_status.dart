enum UserStatus {
  allStatus(1, 'allStatus', 'همه وضعیت ها'),
  pending(2, 'pending', 'در انتظار'),
  rejected(3, 'rejected', 'رد شده'),
  approved(4, 'approved', 'تایید شده');

  final int id;
  final String title;
  final String value;

  const UserStatus(this.id, this.value, this.title);
}
