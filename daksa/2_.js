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

// function banyaknyaAkun(list<Account> account) {
//     let sizeaccount = size.account
//     let valid = true
//     let counter = 0
//     while () {
//         counter = counter + 1
//         valid
//     }

//     if (ada akunnya maka valid) {
//         return valid
//     }

//     if (ada nik maka valid) {
//         return valid
//     }

//     if (ada namanya maka valid) {
//         return valid
//     }
// }