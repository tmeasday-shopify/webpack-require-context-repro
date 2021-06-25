module.exports = {
  mode: "development",
  entry: process.env.USE_RC
    ? "./rc-entry.js"
    : process.env.USE_DYNAMIC
    ? "./dynamic-require-entry.js"
    : "./require-entry.js",
};
