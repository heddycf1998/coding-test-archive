function createAccount() {
    let nomorAccount
    let nama
    let nik
    let statusActive

    // setter & getter
    // setter
    this.setNomorAccount = function(inputNomorAccount) {
        nomorAccount = inputNomorAccount
    }

    this.setNama = function(inputNama) {
        nama = inputNama
    }

    this.setNik = function(inputNik) {
        nik = inputNik
    }

    this.setStatusActive = function(inputStatusActive) {
        statusActive = inputStatusActive
    }

    // getter
    this.getNomorAccount = function() {
        return nomorAccount
    }

    this.getNama = function() {
        return nama
    }

    this.getNik = function() {
        return nik
    }
    
    this.getStatusActive = function() {
        return statusActive
    }

}

function account() {
    let nomorAccount
    let nama
    let nik
    let active

    // setter & getter
    // setter
    this.setNomorAccount = function(inputNomorAccount) {
        nomorAccount = inputNomorAccount
    }

    this.setNama = function(inputNama) {
        nama = inputNama
    }

    this.setNik = function(inputNik) {
        nik = inputNik
    }

    this.setActive = function(inputActive) {
        active = inputActive
    }

    // getter
    this.getNomorAccount = function() {
        return nomorAccount
    }

    this.getNama = function() {
        return nama
    }

    this.getNik = function() {
        return nik
    }

    this.getActive = function() {
        return active
    }
}

const statusActive =  {
    INACTIVE : "INACTIVE",
    ACTIVE : "ACTIVE"
}

// 1. saat user memasukkan nik maka yang keluar malahan nik itu sendiri seharusnya tidak
// 2. pada saat kirim nama malah yang keluar nik seharusnya tidak keluar nama
// 3. user menuliskan nik sebanyak 16 karakter tapi gak bisa buat akun, 16 karakter tersebut adalah emang harus 16 karakter
// 4. banyaknya list akun tapi malah force close atau hang, seharusnya bisa tahu berapa banyak list akun

function validateAccount(input) {
    if (input.getNomorAccount() === null || input.getNomorAccount().trim() === "") {
        throw new Error ("Nomor Akun tidak boleh kosong")
    }

    if (input.getNama() === null || input.getNama().trim() === "" ) {
        throw new Error ("Nama akun tidak boleh kosong")
    }

    if (input.getNik() === null || input.getNik().trim() === "" || input.getNik().length !== 16) {
        throw new Error ("Nomor NIK harus 16 digit")
    }

    let result = new account()
    result.setNomorAccount(input.getNomorAccount())
    result.setNama(input.getNama())
    result.setNik(input.getNik())
    result.setActive(statusActive.ACTIVE)

    return result
}

function listAccount(accounts) {
    let sizeAccount = accounts.length
    let valid = false
    let counter = 0
    
    if (accounts === null || sizeAccount === 0) {
        return false
    }

    while (counter < sizeAccount) {
        let account = accounts[counter]
        let nomorAccount = account.getNomorAccount()
        let nama = account.getNama()
        let nik = account.getNik()

        if (nomorAccount !== null && nama !== null && nik !== null && nik.trim().length === 16) {
            valid = true
        } else {
            return false
        }

        counter = counter + 1
    }

    return valid
}





// Sample Test :
import { assert } from "chai";

describe("Sistem Pendaftaran Akun (Full Flow Test)", () => {
    it("Harus sukses dari pendaftaran sampai masuk list (Data Benar)", () => {
        let form = new createAccount()
        form.setNomorAccount("ACC-001")
        form.setNama("Heddy")
        form.setNik("1234567890123456")

        let akunResmi = validateAccount(form)

        assert.equal(akunResmi.getNomorAccount(), "ACC-001")
        assert.equal(akunResmi.getNama(), "Heddy")
        assert.equal(akunResmi.getNik(), "1234567890123456")

        let daftarNasabah = [akunResmi]
        let hasilFinal = listAccount(daftarNasabah)

        assert.strictEqual(hasilFinal, true, "Valid, Data terisi")
    })

    it("Harus gagal (Throw Error) jika Nomor Akun tidak ada isinya", () => {
        let formSalah = new createAccount();
        formSalah.setNomorAccount("");
        formSalah.setNama("Hei");
        formSalah.setNik("1234567890123456");

        assert.throws(() => {
            validateAccount(formSalah);
        }, Error, "Nomor Akun tidak boleh kosong");
    });

    it("Harus gagal (Throw Error) jika Nama tidak ada isinya", () => {
        let formSalah = new createAccount();
        formSalah.setNomorAccount("ACC-002");
        formSalah.setNama("");
        formSalah.setNik("1234567890123456");

        assert.throws(() => {
            validateAccount(formSalah);
        }, Error, "Nama akun tidak boleh kosong");
    });

    it("Harus gagal (Throw Error) jika NIK di formulir tidak 16 digit", () => {
        let formSalah = new createAccount();
        formSalah.setNomorAccount("ACC-002");
        formSalah.setNama("Bohongan");
        formSalah.setNik("123");

        assert.throws(() => {
            validateAccount(formSalah);
        }, Error, "Nomor NIK harus 16 digit");
    });

    it("Harus INVALID di listAccount jika ada data hantu (NIK null/salah)", () => {
        let akunRusak = new account();
        akunRusak.setNomorAccount("ACC-999");
        akunRusak.setNama("Hacker");
        akunRusak.setNik("123");

        let daftarRusak = [akunRusak];
        
        assert.strictEqual(listAccount(daftarRusak), false, "Harus ditolak oleh listAccount");
    });

    it("Harus VALID (true) jika semua (3 akun) datanya sempurna", () => {
        let data1 = new account();
        data1.setNomorAccount("ACC-001");
        data1.setNama("Heddy");
        data1.setNik("1111222233334444");

        let data2 = new account();
        data2.setNomorAccount("ACC-002");
        data2.setNama("Cahya");
        data2.setNik("5555666677778888");

        let data3 = new account();
        data3.setNomorAccount("ACC-003");
        data3.setNama("Firdaus");
        data3.setNik("9999000011112222");

        let daftarTigaAkun = [data1, data2, data3];

        assert.strictEqual(listAccount(daftarTigaAkun), true, "3 akun benar harus lolos");
    });

    it("Harus INVALID (false) jika ada 1 saja akun yang salah (NIK tidak 16 digit)", () => {
        let ok1 = new account();
        ok1.setNomorAccount("ACC-OK1");
        ok1.setNama("User Benar Satu");
        ok1.setNik("1234567890123456");

        let ok2 = new account();
        ok2.setNomorAccount("ACC-OK2");
        ok2.setNama("User Benar Dua");
        ok2.setNik("6543210987654321");

        let salah = new account();
        salah.setNomorAccount("ACC-FALSE");
        salah.setNama("Si Bohongan");
        salah.setNik("12345");

        let daftarCampuran = [ok1, ok2, salah];

        assert.strictEqual(listAccount(daftarCampuran), false, "List harus ditolak karena ada 1 akun cacat");
    });
})