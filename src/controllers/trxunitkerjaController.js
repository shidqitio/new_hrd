const TrxUnitKerja = require("../models/trxUnitKerja");
const Sequelize = require("sequelize");
const Op = Sequelize.Op;

exports.index = (req, res, next) => {
    TrxUnitKerja.findAll({
        where : {
            kode_unit_kerja : {
                        [Op.notLike] : 'J%'
                    }
        }
    })
    .then((app) => {
        res.json({
            status : "Success", 
            message : "Berhasil Menampilkan Data", 
            data : app,
        });
    })
    .catch((err) => {
        if(!err.statusCode) {
            err.statusCode = 500
        }
        next(err);
    })
}

exports.show = (req, res, next) => {
    TrxUnitKerja.findOne({
        where : {
            kode_unit_kerja : req.params.kode_unit_kerja, 
        }
    })
    .then((app) => {
        if(!app) {
            const error = new Error("Pegawai Tidak Ada"); 
            error.statusCode = 422; 
            throw error
        }
        res.json({
            status : "Success", 
            message : "Berhasil Menampilkan Data", 
            data : app
        });
    })
    .catch((err) => {
        if(!err.statusCode) {
            err.statusCode = 500;
        }
        next(err);
    });
};