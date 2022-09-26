const db = require("../database")
const {DataTypes} = require("sequelize")
const Pegawai = require("./pegawai")
const JenisPegawai = require("./refJenisPegawai")
const TrxJenisPegawai = db.define(
    "TrxJenisPegawai", 
    {
        kode_pegawai : {
            type : DataTypes.STRING(9),
            allowNull : false, 
            primaryKey : true
        }, 
        kode_jenis_pegawai :{
            type : DataTypes.STRING(2), 
            allowNull : false, 
            primaryKey : true
        },
        status_aktif : {
            type : DataTypes.SMALLINT(),
            allowNull : true, 
        }, 
        tahun_masuk : {
            type : DataTypes.STRING(4), 
            allowNull : true
        }, 
        tahun_keluar : {
            type : DataTypes.STRING(4), 
            allowNull : true
        }, 
        berkas : {
            type : DataTypes.STRING(50), 
            allowNull : true
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
        tableName : "trx_jenis_pegawai", 
        createdAt : "udcr", 
        updatedAt : "udch"
    }
)

Pegawai.hasMany(TrxJenisPegawai, {
    foreignKey : "kode_pegawai"
})

TrxJenisPegawai.belongsTo(Pegawai, {
    foreignKey : "kode_pegawai"
})

JenisPegawai.hasMany(Pegawai, {
    foreignKey : "kode_jenis_pegawai"
})

TrxJenisPegawai.belongsTo(JenisPegawai, {
    foreignKey : "kode_jenis_pegawai"
})

module.exports = TrxJenisPegawai