exports.generateKode = (kode) => {

    let newKode = kode;
    
    let kode1 = parseInt(newKode.charAt(5));
    let kode2 = parseInt(newKode.charAt(6));
    
    if (kode2 === 9) {
        kode1 = kode1 + 1;
        kode2 = 0;
        newKode = kode1.toString() + kode2.toString();
    }
    if (kode1 === 0) {
        newKode = kode1.toString() + String(kode2 + 1)
    }
    if (kode >= 10) {
        newKode = parseInt(newKode) + 1
    }
    if (kode === null) {
        newKode = "01"
    } 

    return newKode;
};

