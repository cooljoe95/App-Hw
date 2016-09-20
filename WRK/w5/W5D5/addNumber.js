const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback){
  if (numsLeft === 0) {
    reader.close();
    completionCallback(sum);
  } else {
    reader.question("Please enter a number: ", function(answer){
      answer = parseInt(answer);
      sum += answer;
      console.log(`Partial sum = ${sum}`);
      addNumbers(sum, numsLeft - 1, completionCallback);
    });
  }
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
