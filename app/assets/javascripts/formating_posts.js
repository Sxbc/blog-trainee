$(function() {
  console.log("init");
  $("#post_body").on("keypress", function() {
     $.ajax({
       url: "/format_post",
       data: { raw_post: $(this).val() },
       method: "GET",
       dataType: "json"
     }).done(function(data) {
       $("#output").html(data)
     })
  });
})
