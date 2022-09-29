const { DataTypes } = require("sequelize");
const db = require("../database");
const Agama = require("./agama");
const JenisPegawai = require("./refJenisPegawai")

const Pegawai = db.define(
  "Pegawai",
  {
    nip: {
      type: DataTypes.STRING(20),
      primaryKey: true,
      allowNull: false,
    },
    kode_pegawai: {
      type: DataTypes.STRING(9),
      allowNull: false,
      primaryKey : true
    },
    nama_pegawai: {
      type: DataTypes.STRING(100),
      allowNull: false,
    },
    gelar_depan : {
      type : DataTypes.STRING(50), 
      allowNull : true
    }, 
    gelar_belakang : {
      type : DataTypes.STRING(50), 
      allowNull : true
    },
    kode_anggota_fungsional: {
      type: DataTypes.STRING(20),
      unique: true,
      allowNull: false,
    },
    kode_jenis_pegawai : {
      type : DataTypes.STRING(2), 
      allowNull : true
    },
    tempat_lahir: {
      type: DataTypes.STRING(100),
      allowNull: false,
    },
    tanggal_lahir: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    jenis_kelamin: {
      type: DataTypes.ENUM("Laki-laki", "Perempuan", "Lain-lain"),
      allowNull: false,
    },
    kode_agama: {
      type: DataTypes.STRING(2),
      allowNull: false,
    },
    tmt_cpns: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    tmt_pns: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    alamat: {
      type: DataTypes.STRING(300),
      allowNull: false,
    },
    nomor_telp: {
      type: DataTypes.STRING(30),
      allowNull: false,
    },
    email: {
      type: DataTypes.STRING(100),
      allowNull: false,
    },
    status_nikah: {
      type: DataTypes.ENUM('Nikah','Belum Nikah','Janda','Duda','Tidak Menikah','Relationship','Available'),
      allowNull: false,
    },
    kode_status_aktivitas: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    foto_pegawai: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    facebook : {
      type : DataTypes.STRING(255), 
      allowNull : true
    }, 
    instagram : {
      type : DataTypes.STRING(255), 
      allowNull : true
    },
    ucr: {
      type: DataTypes.STRING(100),
      allowNull: true,
    },
    uch: {
      type: DataTypes.STRING(100),
      allowNull: true,
    },
    udcr: {
      type: DataTypes.DATE,
      allowNull: true,
    },
    udch: {
      type: DataTypes.DATE,
      allowNull: true,
    },
  },
  {
    tableName: "ref_pegawai",
    createdAt: "udcr",
    updatedAt: "udch",
  }
);

Pegawai.belongsTo(Agama, {
  foreignKey: "kode_agama",
});

Agama.hasOne(Pegawai, {
  foreignKey: "kode_agama",
});
module.exports = Pegawai;
