$(document).ready( () =>{
  handleSubmit();
})

handleSubmit = () => {
  $('.submit-link').submit( (event) => {
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
    $('.link-container').append(res);
    $('#title').val('');
    $('#url').val('');
  })
}