const Fakultas = require("../models/fakultas");
const ProgramStudi = require("../models/programStudi");
const {generateKode1} = require("../helper/generatekode1")

exports.index = (req, res, next) => {
  Fakultas.findAll({
    include: [
      {
        model : ProgramStudi, 
        attributes : ["kode_program_studi", "nama_program_studi"],
      }
    ]
  })
    .then((fakultas) => {
      res.json({
        status: "success",
        message: "Berhasil manampilkan data",
        data: fakultas,
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
  Fakultas.max("kode_fakultas")
  .then((kode) => {
    let kode_hasil = generateKode1(kode)

    return Fakultas.create({
      kode_fakultas : kode_hasil, 
      nama_fakultas : req.body.nama_fakultas, 
      ucr : "Indrawan"
    }); 
  })
  .then((fakultas) => {
    res.json({
      status : "Success", 
      message : "Berhasil Menyimpan Data", 
      data: fakultas
    });
  })
  .catch((err) => {
    if(!err.statusCode){
      err.statusCode = 500;
    }
    next(err);
  })
};
exports.show = (req, res, next) => {
  Fakultas.findOne({ where : {kode_fakultas : req.params.kode_fakultas}})
  .then((fakultas) => {
    if(!fakultas) {
      const error = new Error("Kode Fakultas tidak ada.");
      error.statusCode = 422;
      throw error; 
    }
    res.json({
        status: "success",
        message: "Berhasil menampilkan data",
        data: fakultas,
    });
  })
  .catch((err) => {
    if (!err.statusCode) {
      err.statusCode = 500;
    }
    next(err); 
  })
};

exports.update = (req, res, next) => {
  const data = {
    kode_fakultas : req.params.kode_fakultas, 
    nama_fakultas : req.body.nama_fakultas, 
    uch : "Indrawan"
  };

  Fakultas.findOne({where: {kode_fakultas: req.params.kode_fakultas}})
  .then((ex) => {
    if (!ex) {
      const error = new Error("Kode Fakultas tidak ada.");
      error.statusCode = 422;
      throw error;
    }
    return Fakultas.update(data, {where : {kode_fakultas : req.params.kode_fakultas}});
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
  Fakultas.findOne({ where : {kode_fakultas : req.params.kode_fakultas}})
  .then((app) => {
    if(!app) {
      const error = new Error("Kode Fakultas tidak ada.");
      error.statusCode = 422;
      throw error;
    }
    return Fakultas.destroy({
      where : {
        kode_fakultas : req.params.kode_fakultas,
      },
    });
  })
  .then ((response)=>{
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
