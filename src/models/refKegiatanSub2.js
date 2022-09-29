const { DataTypes } = require("sequelize")
const db = require("../database")
const RefKegiatanSub1 = require("./refKegiatanSub1")

const RefKegiatanSub2 = db.define(
    "RefKegiatanSub2",
    {
        kode_kegiatan_sub1: {
            type: DataTypes.STRING(7),
            allowNull: false,
        },
        kode_kegiatan_sub2: {
            type: DataTypes.STRING(10),
            allowNull: false,
            primaryKey: true
        },
        nama_kegiatan_sub2: {
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
            type: DataTypes.INTEGER(11),
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
        tableName: "ref_kegiatan_sub2",
        createdAt: "udcr",
        updatedAt: false
    }
)

RefKegiatanSub1.hasMany(RefKegiatanSub2, {
    foreignKey: "kode_kegiatan_sub1"
})

RefKegiatanSub2.belongsTo(RefKegiatanSub1, {
    foreignKey: "kode_kegiatan_sub1"
})

module.exports = RefKegiatanSub2