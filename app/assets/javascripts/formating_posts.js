$(function() {
  console.log("init");
  $("#post_body").on("change", function() {
    console.log("waka");
     $.ajax({
       url: "/format_post",
       data: { raw_post: $(this).val() },
       method: "GET",
       dataType: "json"
     }).done(function(data) {
       console.log("response", data)
       $("#output").html(data)
     })
  });
})
