const {DataTypes} = require("sequelize")
const db = require("../database")

const JenisPegawai = db.define(
    "JenisPegawai", 
    {
        kode_jenis_pegawai : {
            type : DataTypes.STRING(2), 
            allowNull : false, 
            primaryKey : true
        }, 
        nama_jenis_pegawai : {
            type : DataTypes.STRING(50), 
            allowNull : true, 
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
        tableName : "ref_jenis_pegawai", 
        createdAt : "udcr", 
        updatedAt : "udch"
    }
)

module.exports = JenisPegawai