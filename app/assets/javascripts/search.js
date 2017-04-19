$(document).ready( () => {
  filterLinks();
  unreadFilter();
  readFilter();
})

filterLinks = () => {
  $('input[name=search]').keyup( () => {
    let $rows = $('.link');
    let $search = $('input[name=search]').val().toLowerCase();
    $rows.hide();
    showRows($search, $rows);
  })
}

showRows = ($search, $rows) => {
  for (var i = 0; i < $rows.length; i++) {
    let title = $($rows[i]).children().children('p.link-title').text().toLowerCase();
    let url = $($rows[i]).children().children('p.link-url').text().toLowerCase();
    if ((title.indexOf($search) >= 0) || (url.indexOf($search) >= 0)) {
      $($rows[i]).show();
    }
  }
}

unreadFilter = () => {
  $('.unread-filter').click( () => {
    let $read = $('.true')
    let $rows = $('.link')
    $rows.hide()
    $read.show() // could use .hide() for one way hiding
  })
}

readFilter = () => {
  $('.read-filter').click( () => {
    let $unread = $('.false')
    let $rows = $('.link')
    $rows.hide();    
    $unread.show() // same as above
  })
}