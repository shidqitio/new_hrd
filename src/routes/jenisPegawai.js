const express = require("express");
const{check, validationResult} = require("express-validator");
const router = express.Router();

const {
    index
} = require("../controllers/jenispegawaiController")

router.get("/", index)

module.exports = router