# 💡 Posibles soluciones a las actividades de sintaxis básica

## Actividad 1 - Media

```javascript
let a = 3;
let b = 5;
let c = 8;

let media = (a + b + c) / 3;

console.log(media.toFixed(2));
```

## Actividad 2 - DNI

```javascript
let dni = '12345678z';
const letras = 'TRWAGMYFPDXBNJZSQVHLCKE';

console.log(`dni: ${dni}`);

let numero = dni.substring(0, 8);
let letra = dni.substring(8).toUpperCase();

if (numero.length !== 8) {
  console.log('DNI incorrecto');
  return;
}

numero = parseInt(numero);

if (isNaN(numero) || numero < 0 || numero > 99999999) {
  console.log('DNI incorrecto');
  return;
}

if (typeof letra != 'string') {
  console.log('DNI incorrecto');
  return;
}

console.log(`Formateado: ${numero}-${letra}`);

let resto = numero % 23;

if (letra === letras[resto]) {
  console.log('DNI correcto');
}
else {
  console.log('DNI incorrecto');
  console.log (`La letra correcta para ${numero} es ${letras[resto]}`);
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
      linea += ' *';
    } else {
      linea += '  ';
    }
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
  }

  console.log(linea);
}
```
