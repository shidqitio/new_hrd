const { DataTypes } = require("sequelize");
const db = require("../database");

const THukuman = db.define(
  "THukuman",
  {
    kode_pegawai: {
      type: DataTypes.STRING(9),
      primaryKey: true,
      allowNull: false,
    },
    kode_hukuman: {
      type: DataTypes.STRING(2),
      allowNull: false,
    },
    tanggal_surat_hukuman: {
      type: DataTypes.DATE,
      primaryKey: true,
      allowNull: false,
    },
    nomor_surat_hukuman: {
      type: DataTypes.STRING(100),
      allowNull: false,
    },
    keterangan: {
      type: DataTypes.STRING(300),
      allowNull: false,
    },
    folder_surat_hukuman: {
      type: DataTypes.STRING(100),
      allowNull: false,
    },
    nama_file_surat_hukuman: {
      type: DataTypes.STRING(100),
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
    tableName: "trx_hukuman",
    createdAt: "udcr",
    updatedAt: "udch",
  }
);

module.exports = THukuman;
