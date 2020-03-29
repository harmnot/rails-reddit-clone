$(function() {
   console.log("jquery loaded.....")

   $(".vote").on("click", ".upvote", function() {
      const post_id = $(this).parent().data("id"),
          is_upvote = $(this).hasClass("upvote");
      console.log(`invoke post id ${post_id}`);

      $.ajax({
         url: "/post/vote",
         method: "POST",
         data: {post_id: post_id, upvote: is_upvote},
         success:function() {
            console.log("success to vote..")
         }
      })
   })

});