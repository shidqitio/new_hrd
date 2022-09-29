const express = require("express");
const router = express.Router();
const {
    index,
    // show,
    store,
    // destroy,

} = require("../controllers/refKegiatanSub1");

router.get("/", index);

router.post("/", store)

module.exports = router;
