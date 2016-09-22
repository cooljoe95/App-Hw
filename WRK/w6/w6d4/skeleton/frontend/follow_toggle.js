class FollowToggle {
  constructor(el, options) {
    this.userId = $(el).data("user-id") || options.userId;
    this.followState = options.followState || el.dataset.initialFollowState;
    this.$el = $(el);
    this.render();
    this.$el.on("click", this.handleClick.bind(this)); //GOOD

    // this.$el.on("click", this.handleClick); //BAD
    // this.$el.on("click", (event) => this.handleClick(event));
    // this.$el.on("click", FollowToggle.prototype.handleClick.bind(this)); //GOOD
  }

  render(){
    const state = this.followState === "unfollowed" ? "Follow!" : "Unfollow!";
    this.$el.text(state);
  }

  handleClick(event){
    event.preventDefault();
    let type = this.followState === "unfollowed" ? "POST" : "DELETE";
    let followToggle = this;
    this.followState = this.followState === "unfollowed" ? "following" : "unfollowing";
    $.ajax({
      url: `${this.userId}/follow`,
      type: `${type}`,
      dataType: 'json',
      success(follow){
        followToggle.followState = followToggle.followState === "following" ? "followed" : "unfollowed";
        followToggle.$el.prop("disabled", false);
        followToggle.render();
      }
    });
    this.$el.prop("disabled", true);
  }

}

module.exports = FollowToggle;
