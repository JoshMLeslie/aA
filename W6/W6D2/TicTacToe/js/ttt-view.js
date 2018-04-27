class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {

    this.$el.on("click", "div", (event => {
        const $box = $(event.target);
        this.makeMove($box);
      })
    );

    $('.slider').on("input", (event => {
        const $frame = $('ul');
        const val = event.target.value;
        const adj = 3*val;
        $frame.width(adj);
        $frame.height(adj);

      })
    );

  } // bindEvents end

  makeMove($box) {
    const game = this.game;
    const pos = $box.data("pos");
    const cP = game.currentPlayer;
    // console.log("made a move!");


  try { this.game.playMove(pos); }
  catch (e) { alert("This " + e.msg.toLowerCase()); }

  // color boxes based on player
  if (cP === "x" ) {$box.css("background","#348017"); } // green
  else {$box.css("background", "#C47451");} // orange salmon

  $box.addClass(cP);

  if (this.game.isOver() ) {
    //cleanup clicks
    this.$el.off("click");
    this.$el.addClass("game-over");

    const winner = game.winner();
    const $figcap = $("<figcaption>");

    if (winner) {
      this.$el.addClass("winner-" + winner);

      let color;
      if (cP === "x" ) {color = "Medium Spring Green";}
      else {color = "Orange Salmon";}

      $figcap.html("You win, " + color + "!");

    } else {
      $figcap.html(`Well, that's a draw.`);
    }

    this.$el.append($figcap);
  }
} //makeMove end

  setupBoard() {
    const $ul = this.setupFrame();

    // build grid
    for ( let rowI=0; rowI<3; rowI++ ) {
      for ( let colI=0; colI<3; colI++ ) {
        let $tempBox = this.newBox();
        $tempBox.data("pos",[rowI, colI]);
        $ul.append($tempBox);
      }
    }

    this.$el.append($ul);
  }

  setupFrame(){
    let $tempUl = $('<ul></ul>');

    $tempUl.css({
      "display": "flex",
      "flex-wrap": "wrap",
      "width": "300px",
      "height": "300px",
      "margin": "30px auto",
      "background": "black",
    });

    return $tempUl;
  }

  newBox(){
    let $div = $('<div></div>');

    $div.css({
      // "background": "gray",
      "border" : "3px solid #2554C7",
      "width": "30%",
      "height": "30%",
      "margin": "5px",
      "box-sizing": "border-box"
    });

// hover was causing issues with persistence of colors. So, removed it.
    // $div.hover(
    //   // on rollover
    //   function() { $div.css("background", "blue");},
    //   // on rolloff
    //   function() {
    //     if ($div.css("background") === "blue") {
    //       $div.css("background", "gray");
    //     } else {
    //
    //     }
    //   }
    // );

    return $div;
  }

}

module.exports = View;
