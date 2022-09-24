class SocketIO {
    constructor(socket) {
        this.socket = socket;
    }

    getSuratDinas(data) {
        // return this.socket.broadcast.emit("surat_dinas", data);
        return this.socket.id;
    }

    getSuratUndangan(data) {
        // return this.socket.broadcast.emit("surat_undangan", data);
        return this.socket.id;
    }
}

module.exports = SocketIO;