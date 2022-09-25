const { DataTypes } = require("sequelize")
const db = require("../database")

const TrxJenisPegawai = db.define(
    "SubKelas",
    {
        kode_pegawai: {
            type: DataTypes.STRING(9),
            primaryKey: true,
            allowNull: false,
        },
        kode_jenis_pegawai: {
            type: DataTypes.STRING(2),
            allowNull: false,
        },
        status_aktif: {
            type: DataTypes.TINYINT(4),
            allowNull: false,
        },
        tahun_masuk: {
            type: DataTypes.STRING(4),
            allowNull: false,
        },
        tahun_keluar: {
            type: DataTypes.STRING(4),
            allowNull: true,
        },
        berkas: {
            type: DataTypes.STRING(50),
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
            type: DataTypes.DATE(),
            allowNull: true,
        },
        udch: {
            type: DataTypes.DATE(),
            allowNull: true,
        },
    },
    {
        tableName: "trx_janis_pegawai",
        createdAt: "udcr",
        updatedAt: "udch",
    },
)

module.exports = TrxJenisPegawai;