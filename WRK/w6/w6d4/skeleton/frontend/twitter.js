const FollowToggle = require("./follow_toggle");
const UsersSearch = require("./users_search");
const TweetCompose = require("./tweet_compose");

$(() => {
  $('button.follow-toggle').each((index, value) => {
    new FollowToggle(value);
  });

  $('nav.users-search').each((index, value) => {
    new UsersSearch(value);
  });

  $('.tweet-compose').each((index, value) => {
    new TweetCompose(value);
  });

});
