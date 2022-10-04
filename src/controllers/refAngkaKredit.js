const refAngkaKredit = require("../models/refAngkaKredit");
const refKegiatanSub1 = require("../models/refKegiatanSub1");
const refKegiatanSub2 = require("../models/refKegiatanSub2");
const refKegiatanSub3 = require("../models/refKegiatanSub3");
const refKegiatanSub4 = require("../models/refKegiatanSub4");

exports.reportAngkaKredit = (req, res, next) => {
    refKegiatanSub1.findAll({
        include: [
            {
                model: refKegiatanSub2,
                include: [
                    {
                        model: refKegiatanSub3,
                        include: [
                            {
                                model: refKegiatanSub4
                            }
                        ]
                    }
                ]
            }
        ]
    })
        .then((ress) => {
            if (ress.length === 0) {
                res.json({
                    status: "failed",
                    statusCode: 422,
                    message: "Data Tidak Ada",
                    data: ress,
                });
            }
            res.json({
                status: "success",
                message: "Berhasil manampilkan data",
                data: ress,
            });
        })
        .catch((err) => {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        });
}

exports.index = (req, res, next) => {
    refAngkaKredit.findAll({

    })
        .then((ress) => {
            if (!ress.length === 0) {
                res.json({
                    status: "failed",
                    statusCode: 422,
                    message: "Data Tidak Ada",
                    data: ress,
                });
            }
            res.json({
                status: "success",
                message: "Berhasil manampilkan data",
                data: ress,
            });
        })
        .catch((err) => {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        });
}

exports.show = (req, res, next) => {
    refAngkaKredit.findOne({
        where: { kode_kegiatan: req.params.kode_kegiatan }
    })
        .then((ress) => {
            if (!ress.length === 0) {
                res.json({
                    status: "failed",
                    statusCode: 422,
                    message: "Data Tidak Ada",
                    data: ress,
                });
            }
            res.json({
                status: "success",
                message: "Berhasil manampilkan data",
                data: ress,
            });
        })
        .catch((err) => {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        });
}