module.exports = {
  mode: "development",
  entry: process.env.USE_RC ? "./rc-entry.js" : "./require-entry.js",
};
