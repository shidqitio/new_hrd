const { DataTypes } = require("sequelize")
const db = require("../database")

const RefJenisPegawai = db.define(
    "SubKelas",
    {
        kode_jenis_pegawai: {
            type: DataTypes.STRING(2),
            primaryKey: true,
            allowNull: false,
        },
        nama_jenis_pegawai: {
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
            type: DataTypes.DATE(),
            allowNull: true,
        },
        udch: {
            type: DataTypes.DATE(),
            allowNull: true,
        },
    },
    {
        tableName: "ref_janis_pegawai",
        createdAt: "udcr",
        updatedAt: "udch",
    },
)

module.exports = RefJenisPegawai;