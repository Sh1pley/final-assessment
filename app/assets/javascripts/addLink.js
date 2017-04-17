$(document).ready( () =>{
  handleSubmit();
})

handleSubmit = () => {
  $('.submit-link').click( (event) => {
    event.preventDefault();
    addLink();
  })
}

addLink = () => {
  let linkData = {
    link: {
      url: $('#url').val(),
      title: $('#title').val()
    }
  }

  $.ajax({
    url: '/links',
    method: 'POST',
    data: linkData
  }).done( (res) => {
    $('.alert').remove();
    $('.link-container').prepend(res);
    $('#title').val('');
    $('#url').val('');
  })
}