enum UserStatus {
  allStatus(1,'همه وضعیت ها'),
  pending(2, 'در انتظار'),
  rejected(3, 'رد شده'),
  accepted(4, 'تایید شده');

  final int id;
  final String title;

  const UserStatus(this.id, this.title);
}
