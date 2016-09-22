const FollowToggle = require('./follow_toggle');
class UsersSearch{
  constructor(el){
    this.$el = $(el);
    this.input = "";
    this.$ul = $('.users');
    this.$el.on("keyup", this.handleInput.bind(this));
  }

  handleInput (event) {
    if (event.keyCode === 8){
      this.input = this.input.slice(0, this.input.length-1);
    } else {
      this.input += event.key;
    }
    // this.$ul = this.$el.ul;
    const query = this.input;
    const $ul = this.$ul;
    const renderResults = this.renderResults.bind(this);
    $.ajax({
      url: "./search",
      type: 'GET',
      data: { query: `${query}`},
      dataType: 'json',
      success(users){
        renderResults(users);
        // debugger
      }
    });
  }

  // <% if current_user.follows?(user) %>
  //   <% follows = "followed" %>
  // <% else %>
  //   <% follows = "unfollowed" %>
  // <% end %>

  renderResults(users){
    this.$ul.empty();
    users.forEach( (value, index) => {
      const $userAnchor = $("<a>").attr('href', `./${value.id}`);
      $userAnchor.append(value.username);
      const $userLi = $('<li>').append($userAnchor);
      this.$ul.append($userLi);
      const $followToggleButton = $("<button>").addClass("follow-toggle");
      let followState;
      if(value.followed){
        followState = "followed";
      } else {
        followState = "unfollowed";
      }
      new FollowToggle($followToggleButton, {
        "userId": value.id,
        "followState": `${followState}`
      });
      console.log(value);
      $userLi.append($followToggleButton);
    });
  }

}

module.exports = UsersSearch;
