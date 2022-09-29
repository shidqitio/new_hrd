const RefKegiatanSub4 = require("../models/refKegiatanSub4");
const generateKode = require("../utils/generateCode");
const RefAngkaKredit = require("../models/refAngkaKredit");
const db = require("../database/index");

exports.index = (req, res, next) => {
    RefKegiatanSub4.findAll({
        include: [
            {
                model: RefAngkaKredit
            }
        ]
    })
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
    let kode_kegiatan_sub3 = req.body.kode_kegiatan_sub3
    let nama_kegiatan_sub4 = req.body.nama_kegiatan_sub4
    let satuan_batas_max = req.body.satuan_batas_max
    let keterangan_satuan = req.body.keterangan_satuan
    let angka_kredit = req.body.angka_kredit
    let keterangan_bukti_keg = req.body.keterangan_bukti_keg

    return db.transaction()
        .then(async (t) => {
            RefKegiatanSub4.max("kode_kegiatan_sub4", {
                where: { kode_kegiatan_sub3: kode_kegiatan_sub3 }
            })
                .then((kode) => {
                    let kode_kegiatan_sub = kode_kegiatan_sub3 + "." + generateKode.generateKode4(kode)
                    console.log("kodeeeee", kode_kegiatan_sub)

                    return RefKegiatanSub4.create({
                        kode_kegiatan_sub3: kode_kegiatan_sub3,
                        kode_kegiatan_sub4: kode_kegiatan_sub,
                        nama_kegiatan_sub4: nama_kegiatan_sub4,
                        satuan_batas_max: satuan_batas_max,
                        keterangan_satuan: keterangan_satuan
                    }, { transaction: t })
                        .then((Ress) => {
                            let cek = angka_kredit.length
                            console.log(cek)
                            if (cek !== 0) {
                                return RefAngkaKredit.create({
                                    kode_kegiatan: kode_kegiatan_sub,
                                    angka_kredit: angka_kredit,
                                    keterangan_bukti_keg: keterangan_bukti_keg
                                })
                                    .then((Resss) => {
                                        res.json({
                                            status: "success",
                                            message: "Berhasil menampilkan data",
                                            data: {
                                                kegiatanSub3: Ress,
                                                angkaKredit: Resss
                                            },
                                        });
                                        return t.commit()
                                    })
                                    .catch((err) => {
                                        if (!err.statusCode) {
                                            err.statusCode = 500;
                                        }
                                        t.rollback()
                                        next(err);
                                    });
                            } else {
                                res.json({
                                    status: "success",
                                    message: "Berhasil menyimpan data",
                                    data: Ress,
                                });
                                return t.commit()
                            }
                        })
                        .catch((err) => {
                            if (!err.statusCode) {
                                err.statusCode = 500;
                            }
                            t.rollback()
                            next(err);
                        });
                })
                .catch((err) => {
                    if (!err.statusCode) {
                        err.statusCode = 500;
                    }
                    console.log(err)
                    t.rollback()
                    next(err);
                });
        })
};

exports.show = (req, res, next) => {
    RefKegiatanSub4.findOne({
        where: {
            kode_kegiatan_sub4: req.params.id
        },
        include: [
            {
                model: RefAngkaKredit
            }
        ]
    })
        .then((Res) => {
            if (!Res) {
                const error = new Error("Kode kegiatan Sub 4 tidak ada.");
                error.statusCode = 422;
                throw error;
            }
            res.json({
                status: "success",
                message: "Berhasil menampilkan data",
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

exports.update = (req, res, next) => {
    const dataKegiatan = {
        nama_kegiatan_sub4: req.body.nama_kegiatan_sub4,
        satuan_batas_max: req.body.satuan_batas_max,
        keterangan_satuan: req.body.keterangan_satuan,
        uch: req.body.kode_pegawai
    };

    let kode_kegiatan_sub4 = req.params.id

    RefKegiatanSub4.findOne({ where: { kode_kegiatan_sub4: kode_kegiatan_sub4 } })
        .then((Res) => {
            if (!Res) {
                const error = new Error("Kode kegiatan sub 4 tidak ada.");
                error.statusCode = 422;
                throw error;
            }

            return RefKegiatanSub4.update(dataKegiatan, {
                where: {
                    kode_kegiatan_sub4: kode_kegiatan_sub4
                }
            })
                .then((Ress) => {
                    res.json({
                        status: "success",
                        message: "Berhasil memperbarui data",
                        data: dataKegiatan,
                    });
                })
        })
        .catch((err) => {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        });
};

exports.destroy = (req, res, next) => {
    RefKegiatanSub4.findOne({ where: { kode_kegiatan_sub4: req.params.id } })
        .then((app) => {
            if (!app) {
                const error = new Error("Kode kegiatan sub 4 tidak ada.");
                error.statusCode = 422;
                throw error;
            }
            return RefKegiatanSub4.destroy({
                where: {
                    kode_kegiatan_sub4: req.params.id,
                },
            })
                .then((response) => {
                    return RefAngkaKredit.findOne({ where: { kode_kegiatan: req.params.id } })
                        .then((app) => {
                            if (app.length === 0) {
                                res.json({
                                    status: "success",
                                    message: "Berhasil menghapus data",
                                    data: response,
                                });
                            } else {
                                return RefAngkaKredit.destroy({
                                    where: {
                                        kode_kegiatan: req.params.id,
                                    },
                                })
                                    .then((ree) => {
                                        res.json({
                                            status: "success",
                                            message: "Berhasil menghapus data",
                                            data: response,
                                        });
                                    })
                            }
                        })
                        .catch((err) => {
                            if (!err.statusCode) {
                                err.statusCode = 500;
                            }
                            next(err);
                        });
                })
        })
        .catch((err) => {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        });
};
