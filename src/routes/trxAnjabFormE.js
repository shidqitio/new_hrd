const express = require("express")
const router = express.Router();


const{
    index,
    show
} = require("../controllers/trxanjabformeController");

router.get("/", index)

router.get("/:kode_unit_kerja", show)

module.exports = router;