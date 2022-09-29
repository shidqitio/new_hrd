const { DataTypes } = require("sequelize")
const db = require("../database")
const RefKegiatanSub1 = require("./refKegiatanSub1")
const RefKegiatanSub2 = require("./refKegiatanSub2")
const RefKegiatanSub3 = require("./refKegiatanSub3")
const RefKegiatanSub4 = require("./refKegiatanSub4")

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
            type: DataTypes.FLOAT(11),
            allowNull: false
        },
        satuan_batas_max: {
            type: DataTypes.INTEGER(11),
            allowNull: true
        },
        keterangan_bukti_keg: {
            type: DataTypes.STRING(255),
            allowNull: false
        },
        keterangan_satuan: {
            type: DataTypes.STRING(50),
            allowNull: true
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
        updatedAt: false
    }
)

RefKegiatanSub1.hasMany(RefAngkaKredit, {
    foreignKey: "kode_kegiatan"
})

RefAngkaKredit.belongsTo(RefKegiatanSub1, {
    foreignKey: "kode_kegiatan"
})

RefKegiatanSub2.hasMany(RefAngkaKredit, {
    foreignKey: "kode_kegiatan"
})

RefAngkaKredit.belongsTo(RefKegiatanSub2, {
    foreignKey: "kode_kegiatan"
})

RefKegiatanSub3.hasMany(RefAngkaKredit, {
    foreignKey: "kode_kegiatan"
})

RefAngkaKredit.belongsTo(RefKegiatanSub3, {
    foreignKey: "kode_kegiatan"
})

RefKegiatanSub4.hasMany(RefAngkaKredit, {
    foreignKey: "kode_kegiatan"
})

RefAngkaKredit.belongsTo(RefKegiatanSub4, {
    foreignKey: "kode_kegiatan"
})

module.exports = RefAngkaKredit