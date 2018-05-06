// entry file

const View = require('./ttt-view.js'); // require appropriate file
const Game = require('../nodeSolutions/game.js'); // require appropriate file

$( () => {
  // Your code here
  console.log("Beginning load.");

  const $viewContainer = $('.ttt');
  const game = new Game();
  const view = new View(game, $viewContainer);

  console.log("Load complete.");
});
