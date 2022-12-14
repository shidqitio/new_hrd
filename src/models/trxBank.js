const db = require("../database")
const { DataTypes } = require("sequelize")
const Pegawai = require("./pegawai");
const Bank = require("./bank");


const TrxBank = db.define(
    "TrxBank",
    {
        kode_bank: {
            type: DataTypes.STRING(4),
            primaryKey: true,
            allowNull: false,
        },
        kode_pegawai: {
            type: DataTypes.STRING(9),
            primaryKey: true,
            allowNull: false,
        },
        no_rekening: {
            type: DataTypes.STRING(50),
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
        tableName: "trx_bank",
        createdAt: "udcr",
        updatedAt: "udch"
    },
);

Pegawai.hasMany(TrxBank, {
    foreignKey: "kode_pegawai",
})

TrxBank.belongsTo(Pegawai, {
    foreignKey: "kode_pegawai",
})

Bank.hasMany(TrxBank, {
    foreignKey: "kode_bank",
})

TrxBank.belongsTo(Bank, {
    foreignKey: "kode_bank",
})

module.exports = TrxBank;