class TweetCompose {

  constructor(el) {
    this.$form = $(el);
    this.$content = $('form textarea').text();

    this.mentionedUserIds = [];
    $('form option').each((idx, value) => this.mentionedUserIds.push(value.value));
    this.$form.on("submit", this.submit.bind(this));
    // debugger
  }

  submit(event){
    // debugger
    event.preventDefault();
    const content = JSON.stringify($('.tweet-content').val());
    // const mentionedUserIds = JSON.stringify($(".hi:selected").val());
    const mentionedUserIds = JSON.stringify($(".hi:selected")[0]);
    $.ajax({
      url: "./tweets",
      type: "POST",
      data: { "tweet[content]": content, "tweet[mentions]": mentionedUserIds },
      dataType: 'json',
      success(el){
        console.log("I'm Here");
      }
    });
  }
}


module.exports = TweetCompose;
