$(function() {
   console.log("jquery loaded.....")

   $(".vote").on("click", ".upvote", function() {
      const post_id = $(this).parent().data("id"),
          is_upvote = $(this).hasClass("upvote");
      console.log(`invoke post id ${post_id}`);
   })

   $.ajax({})
});