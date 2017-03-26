const express = require("express"),
      PORT = 8081,
      app = express(),
      ROUTE = process.env.ROUTE || "/";

app.get(ROUTE, function (req, res) {
    res.send("Hello, world!\n");
});

app.listen(PORT);
console.log(`route ${ROUTE} running on http://localhost:`, PORT);
