class Book {
  String _title;
  String author;
  String coverImageUrl;

  Book(this._title, this.author, this.coverImageUrl);
  String get title => _title;
  set title(String title) {
    _title = title;
  }
  void xinchao() {
    print('Xin chào, tôi là một cuốn sách có tiêu đề: $_title');
  }
}