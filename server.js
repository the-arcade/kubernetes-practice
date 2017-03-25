const express = require("express"),
      PORT = 8080,
      app = express();

app.get("/", function (req, res) {
    res.send("Hello, world!\n");
});

app.listen(PORT);
console.log("Running on http://localhost:", PORT);
