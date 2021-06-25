function doRequireFromPart(part) {
  require(`./src/${part}.stories`);
}

doRequireFromPart("folder-0/folder-0/folder-0/file");
