function findAverage(array) {
  if (array.length === 0) {
    return 0;  
  } else {
    const jumlahTotal = array.reduce((akumulator, nilaiSaatIni) => akumulator + nilaiSaatIni, 0)
    const rata_rata = jumlahTotal / array.length
    return rata_rata
  }
}