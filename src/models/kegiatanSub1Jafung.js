const { DataTypes } = require("sequelize");
const db = require("../database");
const KegiatanJafung = require("./kegiatanJafung");

const KegiatanSub1Jafung = db.define(
  "KegiatanSub1Jafung",
  {
    kode_kegiatan_sub1: {
      type: DataTypes.STRING(10),
      primaryKey: true,
      allowNull: false,
    },
    kode_kegiatan: {
      type: DataTypes.STRING(7),
      allowNull: false,
    },
    nama_kegiatan_sub1: {
      type: DataTypes.STRING(150),
      allowNull: false,
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
    tableName: "ref_kegiatan_sub1_jafung",
    createdAt: "udcr",
    updatedAt: "udch",
  }
);

KegiatanJafung.hasMany(KegiatanSub1Jafung, {
  foreignKey: "kode_kegiatan",
});
KegiatanSub1Jafung.belongsTo(KegiatanJafung, {
  foreignKey: "kode_kegiatan",
});




module.exports = KegiatanSub1Jafung;
