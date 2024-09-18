# 💡 Posibles soluciones a las actividades de sintaxis básica

## Actividad 1 - Media

```javascript
let a = 3;
let b = 5;
let c = 8;

let media = (a + b + c) / 3;

let mediaAjustada = media.toFixed(2);

console.log(mediaAjustada);
```

## Actividad 2 - DNI

```javascript
let dni = '12345678z';
const letras = 'TRWAGMYFPDXBNJZSQVHLCKE';

console.log(`dni original: ${dni}`);

let numero = dni.substring(0, 8);

if (numero.length !== 8) {
  console.log('DNI incorrecto (longitud)');
  return;
}

numero = parseInt(numero);

if (isNaN(numero) || numero < 0 || numero > 99999999) {
  console.log('DNI incorrecto (número)');
  return;
}

let letra = dni.substring(8).toUpperCase();

if (letras.split('').indexOf(letra) === -1) {
  console.log('Letra no válida');
  return;
}

console.log(`DNI formateado: ${numero}-${letra}`);

let resto = numero % 23;
let letraCorrecta = letras[resto];

if (letra === letraCorrecta) {
  console.log('DNI correcto :)');
}
else {
  console.log('DNI incorrecto :(');
  console.log (`La letra correcta para ${numero} es ${letraCorrecta}`);
}
```

## Actividad 3 - Diagonal

```javascript
let n = 10;

for (let i = 0; i < n; i++) {
  let linea = '';

  for (let j = 0; j < n; j++) {
    if (j === i) {
      linea += '* ';
    } else {
      linea += '  ';
    }

    // alternativa
    // linea += (j === i) ? '* ' : '  ';
  }

  console.log(linea);
}
```

## Actividad 4 - Diagonal inversa

```javascript
let n = 10;

for (let i = 0; i < n; i++) {
  let linea = '';

  for (let j = 0; j < n; j++) {
    if (j === n - i - 1) {
      linea += '* ';
    } else {
      linea += '  ';
    }

    // alternativa
    // linea += (j === n - i - 1) ? '* ' : '  ';
  }

  console.log(linea);
}
```

## Actividad 5 - Cuadrado

```javascript
let n = 10;

for (let i = 0; i < n; i++) {
  let linea = '';

  for (let j = 0; j < n; j++) {
    if (i === 0 || i === n - 1 || j === 0 || j === n - 1) {
      linea += '* ';
    } else {
      linea += '  ';
    }

    // alternativa
    // linea += (i === 0 || i === n - 1 || j === 0 || j === n - 1) ? '* ' : '  ';
  }

  console.log(linea);
}
```

## Actividad 6 - Triángulo

```javascript
let n = 10;

for (let i = 0; i < n; i++) {
  let linea = '';

  for (let j = 0; j < n; j++) {
    if (j >= n - i - 1) {
      linea += '* ';
    } else {
      linea += '  ';
    }

    // alternativa
    // linea += (j >= n - i - 1) ? '* ' : '  ';
  }

  console.log(linea);
}
```
