exports.generateKode = (kode) => {

    let newKode = kode;

    if (newKode === null) {
        newKode = "01"
    } else {
        let kode1 = parseInt(newKode.charAt(0));
        let kode2 = parseInt(newKode.charAt(1));
        if (newKode >= 10) {
            newKode = parseInt(newKode) + 1
        } else {
            if (kode2 === 9) {
                kode1 = kode1 + 1;
                kode2 = 0;
                newKode = kode1.toString() + kode2.toString();
            }
            if (kode1 === 0) {
                newKode = kode1.toString() + String(kode2 + 1)
            }
        }
    }

    return newKode;
};