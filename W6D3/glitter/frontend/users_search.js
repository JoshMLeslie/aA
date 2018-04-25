class UsersSearch {
  constructor ($el) {
    this.$el = $el;
    this.$input = $('.users-search input').prop("value");
    this.$ul = $('.users-search ul');
    // this.input = $el.data();
  }

  searchUsers(queryVal, success) {
    $.ajax({
      url: "users/search",
      dataType: "json",
      method: "GET",
      data: {queryVal}
    });
  }

  handleInput () {
    // input? do things?
    this.searchUsers(/*more things*/);
  }

}

module.exports = UsersSearch;
