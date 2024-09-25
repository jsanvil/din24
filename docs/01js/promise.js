const throwDices = async (iterations) => {
  const numbers = [];

  for (let i = 0; i < iterations; i++) {
    const number = 1 + Math.floor(Math.random() * 6)
    numbers.push(number);
    if (number === 6) {
      throw new Error('Se ha sacado un 6')
    }
  }

  return {
    error: false,
    value: numbers
  };
}

async function consume() {
  try {
    const result = await throwDices(10);
    console.log(`Tiradas correctas: ${result.value}`)
  } catch (error) {
    console.error(`Error: ${error.message}`)
  }
}

consume()
