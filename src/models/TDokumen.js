const { DataTypes } = require("sequelize");
const db = require("../database");

const TDokumen = db.define(
  "TDokumen",
  {
    kode_pegawai: {
      type: DataTypes.STRING(9),
      primaryKey: true,
      allowNull: false,
    },
    kode_jenis_dokumen: {
      type: DataTypes.STRING(5),
      primaryKey: true,
      unique: true,
      allowNull: false,
    },
    nomor_dokumen: {
      type: DataTypes.STRING(100),
      allowNull: false,
    },
    keterangan_dokumen: {
      type: DataTypes.STRING(100),
      allowNull: false,
    },
    folder_dokumen: {
      type: DataTypes.STRING(100),
      allowNull: false,
    },
    nama_file_dokumen: {
      type: DataTypes.STRING(100),
      allowNull: false,
    },
    tahun: {
      type: DataTypes.STRING(4),
      allowNull: false,
    },
    ucr: {
      type: DataTypes.STRING(100),
      allowNull: false,
    },
    uch: {
      type: DataTypes.STRING(100),
      allowNull: false,
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
    tableName: "trx_dokumen",
    createdAt: "udcr",
    updatedAt: "udch",
  }
);

module.exports = TDokumen;
