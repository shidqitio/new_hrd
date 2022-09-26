const express = require("express");
const { check, validationResult } = require("express-validator");
const router = express.Router();

const {
    index,
    store,
    show,
    update,
    destroy
} = require("../controllers/trxkartuController");

router.get("/", index)

router.get("/:kode_pegawai/:kode_kartu", show);

router.post("/", store)

router.put("/:kode_pegawai/:kode_kartu", update)

router.delete("/:kode_pegawai/:kode_kartu", destroy)

module.exports = router;