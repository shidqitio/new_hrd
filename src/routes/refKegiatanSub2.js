const express = require("express");
const router = express.Router();
const { check, validationResult } = require("express-validator");
const {
    index,
    show,
    store,
    update,
    destroy,

} = require("../controllers/refKegiatanSub2");

router.get("/", index);

router.get("/:id", show);

router.post("/", [
    check("kode_kegiatan_sub1")
        .notEmpty()
        .withMessage("kode kegiatan sub 1 tidak boleh kosong"),
    check("nama_kegiatan_sub2")
        .notEmpty()
        .withMessage("nama kegiatan sub tidak boleh kosong"),
    check("ucr")
        .notEmpty()
        .withMessage("user create tidak boleh kosong")
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
    check("nama_kegiatan_sub2")
        .notEmpty()
        .withMessage("nama kegiatan sub tidak boleh kosong"),
    check("uch")
        .notEmpty()
        .withMessage("user update tidak boleh kosong")
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
