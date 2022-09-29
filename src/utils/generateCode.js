exports.generateKode1 = (kode) => {

    let newKode = kode;

    if (kode === null) {
        newKode = "01"
    } else {
        let cekKode = parseInt(kode.substring(5,7))
        let kode1 = parseInt(newKode.charAt(5));
        let kode2 = parseInt(newKode.charAt(6));
        if(cekKode >= 10){
            newKode = cekKode + 1
        }else{
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

exports.generateKode2 = (kode) => {

    let newKode = kode;

    if (kode === null) {
        newKode = "01"
    } else {
        let cekKode = parseInt(kode.substring(8,10))
        let kode1 = parseInt(newKode.charAt(8));
        let kode2 = parseInt(newKode.charAt(9));
        if(cekKode >= 10){
            newKode = cekKode + 1
        }else{
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

exports.generateKode3 = (kode) => {

    let newKode = kode;

    if (kode === null) {
        newKode = "01"
    } else {
        let cekKode = parseInt(kode.substring(11,13))
        let kode1 = parseInt(newKode.charAt(11));
        let kode2 = parseInt(newKode.charAt(12));
        if(cekKode >= 10){
            newKode = cekKode + 1
        }else{
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

exports.generateKode4 = (kode) => {

    let newKode = kode;

    if (kode === null) {
        newKode = "01"
    } else {
        let cekKode = parseInt(kode.substring(14,16))
        let kode1 = parseInt(newKode.charAt(14));
        let kode2 = parseInt(newKode.charAt(15));
        if(cekKode >= 10){
            newKode = cekKode + 1
        }else{
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