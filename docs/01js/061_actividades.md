# ✍️ Actividades: callbacks, promesas y objetos

## Actividad 1

Dentro del script **`async.js`**, crea una promesa `twoSecondsPromise` que se resuelva a los entre aleatoriamente entre 0 y 2 segundos, simulando una petición a un servidor. La promesa debe devolver un mensaje de éxito si se resuelve en menos de 1 segundo, y un mensaje de error en caso contrario.

Consume la promesa y muestra el mensaje de éxito o error por consola según corresponda.

## Actividad 2

Dentro del script **`async.js`**, crea la función asíncrona `callbackAsync` que hará uso que la promesa anterior y reciba una función _callback_ como parámetro, y se ejecute cuando se resuelva la promesa.

La función _callback_ imprimirá por consola el mensaje `La promesa se ha resuelto` si la promesa se resuelve.

Consume la función `callbackAsync` y muestra por consola el mensaje de éxito o error según corresponda.

## Actividad 3

Dentro del script **`async.js`**, crea una promesa `weatherPromise` que realice una petición `fetch()` a la url `https://wttr.in/Valencia?format=j1` y devuelva el objeto JSON obtenido.

Consume la función `currentWeather` y muestra por consola el objeto JSON obtenido. Lo puedes formatear con `JSON.stringify(jsonData, null, 2)` para que sea más legible, donde `jsonData` es el objeto JSON obtenido.

## Actividad 4

Dentro del script **`async.js`**, crea una función asíncrona `currentWeatherAsync` que consuma la promesa anterior y muestre por consola la **ciudad**, descripción del **estado** actual (_Clear, Cloudy, Light rain, ..._), **temperatura** actual en grados Celsius, la **sensación térmica** y la **velocidad del viento** en km/h.

El mensaje debe ser algo similar a:

```plaintext
Ciudad: Valencia
Estado: Clear
Temperatura: 23°C
Sensación térmica: 25°C
Viento: 6 km/h
```

Debes analizar el objeto JSON obtenido y extraer los datos necesarios del ejercicio anterior.

Consume la función `currentWeatherAsync`, muestra por consola los datos obtenidos y trata los errores que puedan surgir.

## Actividad 5

Dentro del script **`async.js`**, crea la función asíncrona `weatherAsync` que reciba un nombre de **ciudad** (`city`) como parámetro y devuelva un nuevo **objeto** con la ciudad, estado, temperatura, sensación térmica y velocidad del viento.

La función debe realizar una petición `fetch()` a la url `https://wttr.in/${city}?format=j1` y devolver el objeto JSON obtenido.

Consume la función `weatherAsync` con la ciudad de tu elección y muestra por consola los datos obtenidos.

```js title="Ejemplo de objeto devuelto"
{
  city: "Berlin",
  state: "Overcast",
  temperature: 10,
  feelslike: 9,
  wind: 8
}
```

## Actividad 6

Dentro del script **`poo.js`**, crea las clases **`Product`** y **`Store`** tal y como se describen a continuación.

### Clase **_`Product`_**:

La clase **`Product`** representa un **producto** de una tienda. Cada producto tiene un código, un nombre, un precio y un número de unidades.

Propiedades:

- **`cod`**: Privada. Código numérico identificativo del producto.
- **`name`**: Nombre del producto.
- **`price`**: Privada. Precio unitario del producto.
- **`units`**: Número de unidades del producto.

Constructor:

- Recibe el código, nombre, precio y unidades del producto.
- Si no recibe unidades su número por defecto será `1`.

Métodos:

- **`getter`** de `cod`.
- **`getter`** y **`setter`** de `price`.

- **`changeUnits`**_`(units)`_ : Recibe la cantidad a cambiar (_positiva o negativa_) e incrementa o decrementa las unidades en la cantidad recibida.
    - Devuelve la cantidad de unidades actualizada.
    - No se debe permitir que las unidades sean menores de `0`.
- **`getImport`**`()` : Devuelve el importe total del producto (su precio multiplicado por el nº de unidades).
- **`getDescription`**`()` : Mostrará su descripción, sus unidades entre paréntesis, su precio y el importe total. 
    
    _Por ejemplo: `TV Samsung MP45 (5): 235,95 €/u => 1179,75 €`_

### Clase **_`Store`_**

La clase **`Store`** representa un **almacén de productos**. Cada almacén tiene un código y un array de productos.

**Propiedades**:

- **`id`**: Privada. Código numérico que nos pasan al crear el almacén.
- **`products`**. Privada. Array de `Product` que al crearlo estará vacío.

**Constructor**:

- Recibe el código del almacén y lo guarda en la propiedad `id`.
    - Comprueba que el código es un número positivo. Si no lo es lanza un error.

**Métodos**:

- **`getter`** de `id` : Devuelve el código del almacén.
- **`getter`** de `products` : Devuelve el array de productos.
- **`findProduct`**`(cod)` : Recibe un código de producto y devuelve el producto que tiene dicho código o _`null`_ si ese código no existe en el almacén.
- **`addProduct`**`(cod, units, nombre, precio)`: Recibe como parámetro el código y unidades a añadir y, _**opcionalmente**_, el nombre y precio (si se trata de un producto nuevo) y lo añade al almacén.
    - Las unidades a añadir pueden ser negativas.
    - Si existe el código suma al producto las unidades indicadas.
    - Si no existe crea un nuevo producto en el array.
        - En caso de nuevo producto, si no se recibe el nombre o el precio se lanzará un error.
- **`delProduct`**`(cod, units)`: recibe como parámetro el código y las unidades a quitar de un producto y lo resta del almacén.
    - Si el producto no existe lanza un error.
    - Si las unidades a quitar son mayores, lanza un aviso pero quita las unidades que pueda (no puede quedar con unidades negativas).
- **`totalImport`**`()`: Devuelve el valor total de los productos del almacén.
- **`orderByDescrip()`**: devuelve el array de productos ordenado por el nombre.
- **`orderByUnits()`**: devuelve el array de productos ordenado por unidades descendente.
- **`orderByPrice()`**: devuelve el array de productos ordenado por precio unitario ascendente.
- **`lowStock()`**: devuelve un array con los productos que tienen menos de 5 unidades en stock ordenados por unidades descendente.
- **`toString()`**: Devuelve un string con el código del almacén y el número de productos que tiene.
- **`valueOf()`**: Devuelve el `id` del almacén.

### Ejemplo de uso:

```js
let almacen = new Store(1);

almacen.addProduct(1, 4, 'TV Samsung MP45', 345.95);
almacen.addProduct(2, 4, 'Portátil Acer Travelmate 200', 245.95);
almacen.addProduct(3, 15, 'Impresora Epson LX-455', 45.95);
almacen.addProduct(4, 25, 'USB Kingston 16GB', 5.95);
almacen.addProduct(5, 10, 'USB Kingston 32GB', 9.95);
almacen.addProduct(6, 5, 'USB Kingston 64GB', 15.95);

console.log('LISTADO DEL ALMACÉN');
almacen.orderByDescrip().forEach( prod => console.log(prod.getDescription()) );

almacen.addProduct(5, 15, 'USB Kingston 64GB', 15.95);
almacen.delProduct(3, 11);
almacen.delProduct(3, 7);
almacen.addProduct(1, 9);

console.log('LISTADO DEL ALMACÉN ACTUALIZADO');
almacen.orderByDescrip().forEach( prod => console.log(prod.getDescription()) );

console.log('IMPORTE TOTAL DEL ALMACÉN')
console.log(almacen.totalImport())

console.log('ORDENADO POR UNIDADES')
almacen.orderByUnits().forEach( prod => console.log(prod.getDescription()) )

console.log('ORDENADO POR PRECIO')
almacen.orderByPrice().forEach( prod => console.log(prod.getDescription()) )

console.log('PRODUCTOS CON STOCK BAJO')
almacen.lowStock().forEach( prod => console.log(prod.getDescription()) )
```

## Actividad 7

Dentro del script **`poo.js`**, crea la clase **`Offer`** que **extienda** la clase **`Product`** de la actividad anterior.

Propiedades:

- **`discount`** : descuento que se aplica al producto
- **`dateIni`** : fecha de inicio de la oferta
- **`dateEnd`** : fecha de fin de la oferta

Añade los siguientes métodos:

- **`getImport`**`()` : Devuelve el importe total del producto con el descuento aplicado.
- **`getDescription`**`()` : Mostrará su descripción, sus unidades entre paréntesis, su precio, el descuento aplicado, el precio con el descuento y las fechas de inicio y fin de la oferta. _Por ejemplo: _Por ejemplo: `PS5 Pro (5): 799.99 €/u (-10%) => 719.99 € (21/11/2024 - 30/11/2024)`_

Ejemplo de uso:

```js
console.log('OFERTAS');

let oferta = new Offer(6, 'PS5 Pro', 799.99, 100, 10, '21/11/2024', '30/11/2024');
console.log(oferta.getDescription());
console.log(oferta.getImport());

let oferta2 = new Offer(7, 'Nintendo Switch 2', 399.95, 200, 15, '10/10/2024', '25/10/2024');
console.log(oferta2.getDescription());
console.log(oferta2.getImport());
```

Comprueba que se muestra correctamente la descripción del producto con el descuento aplicado.

```plaintext
OFERTAS
PS5 Pro (100): 799.99 €/u (-10%) => 719.99 € (21/11/2024 - 30/11/2024)
71999.0
Nintendo Switch 2 (200): 399.95 €/u (-15%) => 339.96 € (10/10/2024 - 25/10/2024)
67992.0
```

## Actividad 8

Dentro del script **`poo.js`**, crea la clase **`FilterProducts`**. Esta clase tendrá un array de productos con los que se va a trabajar.

**Propiedades**:

- **`products`** : Array de productos.

**Constructor**:

- Recibe un array de productos y lo guarda en la propiedad `products`.

**Métodos**:

- **`toString`**`()` : Devuelve un string con la descripción de todos los productos del array. Un producto por línea.
- **`filterByPrice`**`(min, max)` : Recibe dos valores numéricos que representan el precio mínimo y máximo.
    - `min` por defecto será `0`.
    - `max` por defecto será `Infinity`.
    - Devuelve un nuevo objeto `FilterProducts` con los productos cuyo precio está entre esos valores.
- **`filterByUnits`**`(min, max)` : Recibe dos valores numéricos que representan el número mínimo y máximo de unidades.
    - `min` por defecto será `0`.
    - `max` por defecto será `Infinity`.
    - Devuelve un nuevo objeto `FilterProducts` con los productos cuyo número de unidades está entre esos valores.
- **`filterByDescription`**`(text)` : Recibe un texto y devuelve un nuevo objeto `FilterProducts` con los productos cuya descripción **contiene** ese texto (sin distinguir mayúsculas y minúsculas).
    - `text` por defecto será `''`.
    - Devuelve un nuevo objeto `FilterProducts` con los productos cuya descripción contiene ese texto.
- **`sortByName`**`()`: Devuelve un nuevo objeto `FilterProducts` con los productos ordenados por nombre, sin distinguir mayúsculas y minúsculas.
- **`sortByPrice`**`()`: Devuelve un nuevo objeto `FilterProducts` con los productos ordenados por precio.
- **`sortByUnits`**`()`: Devuelve un nuevo objeto `FilterProducts` con los productos ordenados por unidades.

Comprueba que se muestran correctamente los productos filtrados.

```js
let filtroPrecio = new FilterProducts(almacen.products);


console.log('FILTRADO POR PRECIO');
// Filtramos los productos cuyo precio está entre 10 y 50 €
let filtradoPrecio = filtroPrecio.filterByPrice(10, 50);
console.log(filtradoPrecio.toString());

console.log('FILTRADO POR UNIDADES');
// Filtramos los productos cuyas unidades están entre 5 y 20
let filtradoUnidades = filtroPrecio.filterByUnits(5, 20);
console.log(filtradoUnidades.toString());

console.log('FILTRADO POR DESCRIPCIÓN');
// Filtramos los productos cuya descripción contiene 'TV'
let filtradoDescrip = filtroPrecio.filterByDescription('king');
console.log(filtradoDescrip.toString());

console.log('ORDENADO POR NOMBRE');
// Ordenamos los productos por nombre
let ordenadoNombre = filtroPrecio.sortByName();
console.log(ordenadoNombre.toString());

// Combina varios filtros y ordenaciones
console.log('FILTRADO Y ORDENADO');
// Filtramos los productos cuyo precio está entre 10 y 50 € y sus unidades entre 5 y 20, ordenados por precio
let combinacion = filtroPrecio.filterByPrice(10, 50).filterByUnits(5, 20).sortByPrice();
console.log(combinacion.toString());

// De esta forma se pueden encadenar varios métodos
// para hacer varias operaciones consecutivas
// de filtrado y ordenación sobre el array de productos.
//
// En aplicaciones reales se suelen hacer varias operaciones de este tipo
// según las preferencias del usuario.
```
