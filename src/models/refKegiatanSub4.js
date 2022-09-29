const { DataTypes } = require("sequelize")
const db = require("../database")
const RefKegiatanSub3 = require("./refKegiatanSub3")

const RefKegiatanSub4 = db.define(
    "RefKegiatanSub4",
    {
        kode_kegiatan_sub3: {
            type: DataTypes.STRING(13),
            allowNull: false,
        },
        kode_kegiatan_sub4: {
            type: DataTypes.STRING(16),
            allowNull: false,
            primaryKey: true
        },
        nama_kegiatan_sub4: {
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
        tableName: "ref_kegiatan_sub4",
        createdAt: "udcr",
        updatedAt: "udch"
    }
)

RefKegiatanSub3.hasMany(RefKegiatanSub4, {
    foreignKey: "kode_kegiatan_sub3"
})

RefKegiatanSub4.belongsTo(RefKegiatanSub3, {
    foreignKey: "kode_kegiatan_sub3"
})

module.exports = RefKegiatanSub4