const UnsurPendukung = require("../models/unsurPendukung");

exports.index = (req,res, next) => {
    UnsurPendukung.findAll()
    .then((unsur) => {
        if(unsur.length === 0){
            const error = new Error("Kode Unsur Pendukung Tidak Ada");
            error.statusCode = 422; 
            throw error;
        }
        res.json({
            status : "Success", 
            message : "Berhasil Menampilkan Data", 
            data : unsur,
        });
    })
    .catch((err) => {
        if(!err.statusCode) {
            err.statusCode = 500;
        }
        next(err);
    });
};

exports.show = (req, res, next) => {
    UnsurPendukung.findOne({where : {kode_unsur_Pendukung : req.params.id}})
    .then((app) => {
        if(!app) {
            const error = new Error("Kode Unsur Pendukung Tidak Ada");
            error.statusCode = 422; 
            throw error;
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