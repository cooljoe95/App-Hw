const FollowToggle = require("./follow_toggle");
const UsersSearch = require("./users_search");

$(() => {
  $('button.follow-toggle').each((index, value) => {
    new FollowToggle(value);
  });

  $('nav.users-search').each((index, value) => {
    new UsersSearch(value);
  });
});
