const JenisKaryaTulis = require('../models/jenisKaryaTulisan');
const { generateKode } = require('../helper/generatekode2')

exports.index = (req, res, next) => {
    JenisKaryaTulis.findAll()
        .then((kartul) => {
            res.json({
                status: "Success",
                message: "Berhasil Menampilkan Data",
                data: kartul,
            });
        })
        .catch((err) => {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        });
};

exports.store = (req, res, next) => {
    JenisKaryaTulis.max("kode_jenis_karya_tulis")
        .then((kode) => {
            let kode_jenis_karya_tulis = generateKode(kode)

            return JenisKaryaTulis.create({
                kode_jenis_karya_tulis: kode_jenis_karya_tulis,
                nama_jenis_karya_tulis: req.body.nama_jenis_karya_tulis,
                ucr: req.user,
            });
        })
        .then((kartul) => {
            res.json({
                status: "Success",
                message: "Berhasil Menyimpan Data",
                data: kartul,
            });
        })
        .catch((err) => {
            console.log(err)
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        });
};

exports.show = (req, res, next) => {
    JenisKaryaTulis.findOne({ where: { kode_jenis_karya_tulis: req.params.kode_jenis_karya_tulis } })
        .then((kartul) => {
            if (!kartul) {
                const error = new Error("Kode Jenis Karya Tulis Tidak Ada");
                error.statusCode = 422;
                throw error;
            }
            res.json({
                status: "Success",
                message: "Berhasil Menampilkan Data",
                data: kartul,
            });
        })
        .catch((err) => {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        });
};

exports.update = (req, res, next) => {
    const data = {
        kode_jenis_karya_tulis: req.params.kode_jenis_karya_tulis,
        nama_jenis_karya_tulis: req.body.nama_jenis_karya_tulis
    }
    JenisKaryaTulis.findOne({ where: { kode_jenis_karya_tulis: req.params.kode_jenis_karya_tulis } })
        .then((kartul) => {
            if (!kartul) {
                const error = new Error("Kode Jenis Karya Tulis Tidak Ada");
                error.statusCode = 422;
                throw error;
            }
            return JenisKaryaTulis.update(data, { where: { kode_jenis_karya_tulis: req.params.kode_jenis_karya_tulis } })
        })
        .then((up) => {
            res.json({
                status: "Success",
                message: "Berhasil Memperbarui Data",
                data: data,
            });
        })
        .catch((err) => {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        });
};

exports.destroy = (req, res, next) => {
    JenisKaryaTulis.findOne({ where: { kode_jenis_karya_tulis: req.params.kode_jenis_karya_tulis } })
        .then((app) => {
            if (!app) {
                const error = new Error("Kode Jenis Karya Tulis Tidak Ada");
                error.statusCode = 422;
                throw error;
            }
            return JenisKaryaTulis.destroy({
                where: { kode_jenis_karya_tulis: req.params.kode_jenis_karya_tulis }
            });
        })
        .then((response) => {
            res.json({
                status: "success",
                message: "Berhasil Menghapus Data",
                data: response
            });
        })
        .catch((err) => {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        });
};