const { DataTypes } = require("sequelize");
const db = require("../database");

const TKoleksiAngkaKreditHeader = db.define(
  "TKoleksiAngkaKreditHeader",
  {
    kode_pegawai: {
      type: DataTypes.STRING(9),
      primaryKey: true,
      allowNull: false,
    },
    koleksi_ke: {
      type: DataTypes.INTEGER(3),
      allowNull: false,
    },
    status_penilaian: {
      type: DataTypes.STRING(1),
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
    tableName: "trx_koleksi_angka_kredit_header",
    createdAt: "udcr",
    updatedAt: "udch",
  }
);

module.exports = TKoleksiAngkaKreditHeader;
