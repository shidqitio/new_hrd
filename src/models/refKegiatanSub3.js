const { DataTypes } = require("sequelize")
const db = require("../database")
const RefKegiatanSub2 = require("./refKegiatanSub2")

const RefKegiatanSub3 = db.define(
    "RefKegiatanSub3",
    {
        kode_kegiatan_sub2: {
            type: DataTypes.STRING(10),
            allowNull: false,
        },
        kode_kegiatan_sub3: {
            type: DataTypes.STRING(13),
            allowNull: false,
            primaryKey: true
        },
        nama_kegiatan_sub3: {
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
        tableName: "ref_kegiatan_sub3",
        createdAt: "udcr",
        updatedAt: "udch"
    }
)

RefKegiatanSub2.hasMany(RefKegiatanSub3, {
    foreignKey: "kode_kegiatan_sub2"
})

RefKegiatanSub3.belongsTo(RefKegiatanSub2, {
    foreignKey: "kode_kegiatan_sub2"
})

module.exports = RefKegiatanSub3