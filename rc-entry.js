const context = require.context("./src", true, /\.stories\.js$/);

context.keys().forEach((key) => context(key));
