const RefJenisPegawai = require("../models/refJenisPegawai")

exports.index = (req, res, next) => {
    RefJenisPegawai.findAll({
        attributes : ["kode_jenis_pegawai","nama_jenis_pegawai"]
    })
    .then((data) => {
        if(data === 0) {
            const error = new Error("Data Tidak Ada")
            error.statusCode = 422; 
            throw error
        }
        res.json({
            status: "Success", 
            message : "Berhasil Menampilkan Data", 
            data : data,
        });
    })
    .catch((err) => {
        if(!err.statusCode) {
            err.statusCode = 500;
        }
        next(err);
    });
}