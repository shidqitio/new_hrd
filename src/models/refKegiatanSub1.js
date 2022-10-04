const { DataTypes } = require("sequelize")
const db = require("../database")
const unsurUtama = require("./unsurUtama")
const unsurPendukung = require("./unsurPendukung")

const RefKegiatanSub1 = db.define(
    "RefKegiatanSub1",
    {
        kode_unsur_utama: {
            type: DataTypes.STRING(4),
            allowNull: true,
        },
        kode_unsur_pendukung: {
            type: DataTypes.STRING(4),
            allowNull: true,
        },
        kode_kegiatan_sub1: {
            type: DataTypes.STRING(7),
            allowNull: false,
            primaryKey: true
        },
        nama_kegiatan_sub1: {
            type: DataTypes.TEXT(),
            allowNull: false
        },
        satuan_batas_max: {
            type: DataTypes.INTEGER(11),
            allowNull: false
        },
        keterangan_satuan: {
            type: DataTypes.STRING(50),
            allowNull: false
        },
        angka_kredit: {
            type: DataTypes.FLOAT(11),
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
        tableName: "ref_kegiatan_sub1",
        createdAt: "udcr",
        updatedAt: false
    }
)

unsurUtama.hasMany(RefKegiatanSub1, {
    foreignKey: "kode_unsur_utama"
})

RefKegiatanSub1.belongsTo(unsurUtama, {
    foreignKey: "kode_unsur_utama"
})

unsurPendukung.hasMany(RefKegiatanSub1, {
    foreignKey: "kode_unsur_pendukung"
})

RefKegiatanSub1.belongsTo(unsurPendukung, {
    foreignKey: "kode_unsur_pendukung"
})

module.exports = RefKegiatanSub1