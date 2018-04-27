// entry file:
// require everything
const FollowToggle = require('./follow_toggle.js');
const UsersSearch = require('./users_search.js');

function runSetup () {
  // things
  buildToggles();
  buildSearch();

}

function buildToggles () {
  $('.follow-toggle').each ((index, el) => {
    let $el = $(el);
    let newTog = new FollowToggle($el);
  });
}

function buildSearch () {
  $('.users-search').each ((index, el) => {
    // let $el = $(el);
    let newSearch = new UsersSearch(el);
  });
}

$(runSetup);
window.runSetup = runSetup;
