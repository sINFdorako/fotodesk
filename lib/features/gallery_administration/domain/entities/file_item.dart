abstract class FileItem {
  final String name;
  final DateTime created;
  final DateTime lastUpdated;
  int? size;

  FileItem(
    this.name,
    this.created,
    this.lastUpdated,
  );
}

class FolderItem extends FileItem {
  List<FileItem> children;

  FolderItem(String name, DateTime created, DateTime lastUpdated, this.children)
      : super(name, created, lastUpdated);
}

class ImageItem extends FileItem {
  final String extension;

  ImageItem(String name, DateTime created, DateTime lastUpdated, this.extension)
      : super(name, created, lastUpdated);
}
