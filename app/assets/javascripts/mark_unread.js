$( document ).ready(function(){
  $("body").on("click", ".mark-as-unread", markAsUnread)
})

function markAsUnread(e) {
  e.preventDefault();

  var $link = $(this).parents('.link');
  var linkId = $link.data('link-id');

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: false },
  }).then(updateLinkStatus)
    .fail(displayFailure);
}

function updateLinkStatus(link) {
  $(`.link[data-link-id=${link.id}]`).find(".read-status").text('Read: ' + link.read);
  $(`.link[data-link-id=${link.id}]`).find(".mark-as-unread").text('Mark as Read');
  $(`.link[data-link-id=${link.id}]`).toggleClass('false true');
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
