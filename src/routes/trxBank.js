const express = require("express")
const router = express.Router();

const {
    index, 
    show, 
    store, 
    update, 
    destroy
} = require("../controllers/trxbankController");

const {check , validationResult} = require("express-validator");

router.get("/", index);

router.get("/:kode_pegawai/:kode_bank", show);

router.post("/", store)

router.put("/:kode_pegawai/:kode_bank", update)

router.delete("/:kode_pegawai/:kode_bank", destroy)

module.exports = router