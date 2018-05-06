class FollowToggle {

  constructor ($el) {
    // let $followButton = $('.follow-toggle'); // this is $el
    this.$el = $el;
    this.userId = $el.data("user-id"); // => now has button data in it
    this.followState = $el.data("initial-follow-state");
    this.render();

    // this.$el.on("click", this.handleClick);
    // this.$el.on("click", (event) => {
    //   event.preventDefault();
    //   this.handleClick();
    // });
    this.$el.on("click", this.handleClick.bind(this));
  }

  render () {
    this.$el.context.disabled = false;

    let fol = this.followState;
    if ( fol === false) {
      this.$el.text("Follow!");
    } else if (fol === true) {
      this.$el.text("Unfollow!");
    } else {
      alert('bananas');
    }
  }

  handleClick (event) {
    this.$el.context.disabled = true;
    //
    // let request = "POST";
    // if (this.followState === true) { request = "DELETE"; }

    let request = this.followState ? "DELETE" : "POST";

    let toggleAction = $.ajax({
      url: `/users/${this.userId}/follow`,
      method: request,
      dataType: "json"
    });

    toggleAction.then((response) => {
      this.followState = !this.followState;
      this.render();
    }, this.render.bind(this));
  }


} // class end

module.exports = FollowToggle;
