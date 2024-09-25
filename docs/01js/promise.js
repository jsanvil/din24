function suma(...numeros) {
  let total = 0
  for (let i = 0; i < numeros.length; i++) {
    total += numeros[i]
  }
  return total
}

let resultado = suma(2, 4, 6)  // resultado = 12
console.log(resultado)