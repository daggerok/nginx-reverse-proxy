const express = require('express');
const app = express();
const publicDir = `${__dirname}/public`;
const port = process.env.PORT || 3000;

app.use(express.static(publicDir));

app.use((req, res, next) => {
  res.sendFile(`${publicDir}/index.html`);
});

app.listen(port, (req, res) => {
  console.log(`server running on port ${port}`);
});
