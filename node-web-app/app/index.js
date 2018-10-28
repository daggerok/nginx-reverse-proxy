const express = require('express');
const app = express();

app.set('views', __dirname + '/public');
app.set('view engine', 'pug');

app.use((req, res, next) => {
  res.render('index', {
    title: 'Should redirect',
    message: 'Hello from node!',
  });
});

const port = process.env.PORT || 3000;
app.listen(port, (req, res) => {
  console.log(`server running on port ${port}`);
});
