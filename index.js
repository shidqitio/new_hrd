const express = require("express");
const app = express();
const db = require("./src/database");
const bodyParser = require("body-parser");
const cors = require("cors");
const path = require("path");
const { Server } = require("socket.io");

const https = require("https");
const fs = require("fs");

require("dotenv").config();
require("dotenv").config({ path: __dirname + "/.env" });

app.use("/public", express.static(path.join(__dirname, "public")));

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(cors());

app.use(require("./src/routes"));

app.use(require("./src/middlewares/errorHandler"));

// CERTIFICATE KEYS
var key = fs.readFileSync(__dirname + "/src/cert/ut2022-upd.key");
var cert = fs.readFileSync(__dirname + "/src/cert/ut2022-upd.crt");
var options = {
  key: key,
  cert: cert,
};


db.sync()
  .then(() => {
    var server = https.createServer(options, app);

    server.listen(process.env.SERVER_PORT, () =>
      console.log(
        `${String.fromCodePoint(0x1f525)} server on port: ${
          process.env.SERVER_PORT
        } ${String.fromCodePoint(0x1f525)}`
      )
    );
    const io = new Server(server, {
      cors: {
        origin: "http://localhost:3000",
        methods: ["GET", "POST"],
      },
    });
    io.on("connection", (socket) => {
      const SoketIO = require("./src/config/socket");
      global.globalSocket = new SoketIO(socket);
    });
  })
  .catch((err) => {
    console.log(
      `${String.fromCodePoint(0x1f621)} database error: ${
        err.message
      } ${String.fromCodePoint(0x1f621)}`
    );
  });