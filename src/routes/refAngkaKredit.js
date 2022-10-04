const express = require("express")
const router = express.Router()

const {
    reportAngkaKredit,
    index,
    show
} = require("../controllers/refAngkaKredit");

router.get("/report", reportAngkaKredit)
router.get("/", index)
router.get("/:kode_kegiatan", show)

module.exports = router