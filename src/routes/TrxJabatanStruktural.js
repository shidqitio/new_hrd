const express = require("express");
const router = express.Router();

const {
    index, 
    show, 
    store, 
    update, 
    destroy
} = require("../controllers/trxjabatansturkturalController")

const {check, validationResult} = require("express-validator")

router.get("/", index)

router.get("/:kode_pegawai/:kode_jabatan_struktural/:periode", show)

router.post("/", store)

router.put("/:kode_pegawai/:kode_jabatan_struktural/:periode", update)

router.delete("/:kode_pegawai/:kode_jabatan_struktural/:periode", destroy)

module.exports = router