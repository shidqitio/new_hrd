const express = require("express");
const router = express.Router();
const { check, validationResult } = require("express-validator");
const {
    index,
    show,
    store,
    update,
    destroy,

} = require("../controllers/refKegiatanSub1");

router.get("/", index);

router.get("/:id", show);

router.post("/", [
    check("nama_kegiatan_sub1")
        .notEmpty()
        .withMessage("nama kegiatan sub Tidak Boleh Kosong"),
    check("ucr")
        .notEmpty()
        .withMessage("User Create tidak boleh kosong")
],
    (req, res, next) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            const error = new Error();
            error.statusCode = 422;
            error.message = errors.array();
            throw error
        }
        next();
    }, store);

router.put("/:id", [
    check("nama_kegiatan_sub1")
        .notEmpty()
        .withMessage("nama kegiatan sub Tidak Boleh Kosong"),
    check("ucr")
        .notEmpty()
        .withMessage("User Update tidka boleh kosong")
],
    (req, res, next) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            const error = new Error();
            error.statusCode = 422;
            error.message = errors.array();
            throw error
        }
        next();
    }, update);

router.delete("/:id", destroy);

module.exports = router;
