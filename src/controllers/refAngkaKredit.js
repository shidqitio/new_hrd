const refAngkaKredit = require("../models/refAngkaKredit");
const refKegiatanSub1 = require("../models/refKegiatanSub1");
const refKegiatanSub2 = require("../models/refKegiatanSub2");
const refKegiatanSub3 = require("../models/refKegiatanSub3");
const refKegiatanSub4 = require("../models/refKegiatanSub4");

exports.index = (req, res, next) => {
    refAngkaKredit.findAll({

    })
    // refAngkaKredit.findAll({
    //     include: {
    //         model: refKegiatanSub1
    //     },
    //     include: {
    //         model: refKegiatanSub2,
    //         include: {
    //             model: refKegiatanSub1
    //         }
    //     },
    //     include: {
    //         model: refKegiatanSub3,
    //         include: {
    //             model: refKegiatanSub2,
    //             include: {
    //                 model: refKegiatanSub1
    //             }
    //         }
    //     },
    //     include: {
    //         model: refKegiatanSub4,
    //         include: {
    //             model: refKegiatanSub3,
    //             include: {
    //                 model: refKegiatanSub2,
    //                 include: {
    //                     model: refKegiatanSub1
    //                 }
    //             }
    //         }
    //     }
    // })
    // refKegiatanSub1.findAll({
    //     include: {
    //         model: refAngkaKredit
    //     },
    //     include: {
    //         model: refKegiatanSub2,
    //         include: {
    //             model: refAngkaKredit
    //         },
    //         include: {
    //             model: refKegiatanSub3,
    //             include: {
    //                 model: refAngkaKredit
    //             },
    //             include: {
    //                 model: refKegiatanSub4,
    //                 include: {
    //                     model: refAngkaKredit
    //                 }
    //             }
    //         }
    //     }
    // })
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

exports.show = (req, res, next) => {

}