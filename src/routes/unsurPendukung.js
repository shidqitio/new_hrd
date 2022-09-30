const express = require("express");
const router = express.Router();
const {
    index,
    // create,
    show,
    // updateId,
    // deleteId,
} = require("../controllers/unsurPendukung");

router.get("/", index);
router.get("/:id", show);


module.exports = router;
