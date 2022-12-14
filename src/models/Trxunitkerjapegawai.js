const { DataTypes } = require("sequelize");
const db = require("../database")
const Pegawai = require("./pegawai")
const Unit = require("./unit")

const TrxUnitKerjaPegawai = db.define(
    "TrxUnitKerjaPegawai",
    {
        kode_unit: {
            type: DataTypes.STRING(16),
            primaryKey: true,
            allowNull: false,
        },
        kode_pegawai: {
            type: DataTypes.STRING(9),
            allowNull: false,
            primaryKey : true
        },
        tanggal_mulai: {
            type: DataTypes.STRING(4),
            allowNull: true,
        },
        tanggal_akhir: {
            type: DataTypes.STRING(4),
            allowNull: true,
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
        tableName: "trx_unit_kerja_pegawai",
        createdAt: "udcr",
        updatedAt: "udch",
    }
);

Pegawai.hasMany(TrxUnitKerjaPegawai, {
    foreignKey: "kode_pegawai",
})

TrxUnitKerjaPegawai.belongsTo(Pegawai, {
    foreignKey: "kode_pegawai"
})

Unit.hasMany(TrxUnitKerjaPegawai, {
    foreignKey: "kode_unit",
})

TrxUnitKerjaPegawai.belongsTo(Unit, {
    foreignKey: "kode_unit"
})

module.exports = TrxUnitKerjaPegawai;