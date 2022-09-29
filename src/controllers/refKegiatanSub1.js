const RefKegiatanSub1 = require("../models/refKegiatanSub1");
const generateCode = require("../utils/generateCode");
const RefAngkaKredit = require("../models/refAngkaKredit");

exports.index = (req, res, next) => {
    RefKegiatanSub1.findAll()
        .then((Res) => {
            if (Res.length === 0) {
                res.json({
                    status: "failed",
                    statusCode: 422,
                    message: "Data Tidak Ada",
                    data: Res,
                });
            }
            res.json({
                status: "success",
                message: "Berhasil manampilkan data",
                data: Res,
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
    let kode_unsur_utama = req.body.kode_unsur_utama
    let nama_kegiatan_sub1 = req.body.nama_kegiatan_sub1
    let satuan_batas_max = req.body.satuan_batas_max
    let keterangan_satuan = req.body.keterangan_satuan
    let angka_kredit = req.body.angka_kredit

    RefKegiatanSub1.max("kode_kegiatan_sub1", {
        where: { kode_unsur_utama: kode_unsur_utama }
    })
        .then((kode) => {
            let kode_kegiatan_sub = kode_unsur_utama + "." + generateCode(kode)

            return RefKegiatanSub1.create({
                kode_unsur_utama: kode_unsur_utama,
                kode_kegiatan_sub: kode_kegiatan_sub,
                nama_kegiatan_sub1: nama_kegiatan_sub1,
                satuan_batas_max: satuan_batas_max,
                keterangan_satuan: keterangan_satuan
            })
                .then((Ress) => {
                    if (angka_kredit !== null) {
                        return RefAngkaKredit.create({
                            kode_kegiatan: kode_kegiatan_sub,
                            angka_kredit: angka_kredit
                        })
                            .then((Resss) => {
                                res.json({
                                    status: "success",
                                    message: "Berhasil menyimpan data",
                                    data: Ress,
                                });
                            })
                            .catch((err) => {
                                if (!err.statusCode) {
                                    err.statusCode = 500;
                                }
                                next(err);
                            });
                    }
                })
                .catch((err) => {
                    if (!err.statusCode) {
                        err.statusCode = 500;
                    }
                    next(err);
                });
        })
        .catch((err) => {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        });
};

exports.show = (req, res, next) => {
    Agama.findOne({ where: { kode_agama: req.params.id } })
        .then((agama) => {
            if (!agama) {
                const error = new Error("Kode agama tidak ada.");
                error.statusCode = 422;
                throw error;
            }
            res.json({
                status: "success",
                message: "Berhasil menampilkan data",
                data: agama,
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
        kode_agama: req.params.id,
        nama_agama: req.body.nama_agama,
        uch: req.user.nama_pegawai,
    };

    Agama.findOne({ where: { kode_agama: req.params.id } })
        .then((ex) => {
            if (!ex) {
                const error = new Error("Kode agama tidak ada.");
                error.statusCode = 422;
                throw error;
            }

            return Agama.update(data, { where: { kode_agama: req.params.id } });
        })
        .then((up) => {
            res.json({
                status: "success",
                message: "Berhasil memperbarui data",
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
    Agama.findOne({ where: { kode_agama: req.params.id } })
        .then((app) => {
            if (!app) {
                const error = new Error("Kode agama tidak ada.");
                error.statusCode = 422;
                throw error;
            }
            return Agama.destroy({
                where: {
                    kode_agama: req.params.id,
                },
            });
        })
        .then((response) => {
            res.json({
                status: "success",
                message: "Berhasil menghapus data",
                data: response,
            });
        })
        .catch((err) => {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        });
};
