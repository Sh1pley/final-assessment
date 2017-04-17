$(document).ready( () => {
  filterLinks();
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