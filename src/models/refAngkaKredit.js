const { DataTypes } = require("sequelize")
const db = require("../database")

const RefAngkaKredit = db.define(
    "RefAngkaKredit",
    {
        kode_kegiatan: {
            type: DataTypes.STRING(16),
            allowNull: false,
        },
        kode_angka_kredit: {
            type: DataTypes.INTEGER(11),
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        angka_kredit: {
            type: DataTypes.INTEGER(11),
            allowNull: false
        },
        satuan_batas_max: {
            type: DataTypes.INTEGER(11),
            allowNull: false
        },
        keterangan_bukti_keg: {
            type: DataTypes.STRING(255),
            allowNull: false
        },
        keterangan_satuan: {
            type: DataTypes.STRING(50),
            allowNull: false
        },
        pelaksana: {
            type: DataTypes.STRING(100),
            allowNull: true
        },
        output: {
            type: DataTypes.STRING(100),
            allowNull: true
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
        tableName: "ref_angka_kredit",
        createdAt: "udcr",
        updatedAt: "udch"
    }
)

module.exports = RefAngkaKredit