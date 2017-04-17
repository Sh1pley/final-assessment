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
  let link = {
    url: $('#url').val(),
    title: $('#title').val()
  }
  $.ajax({
    url: '/links',
    method: 'POST',
    data: link
  }).done( (res) => {
    console.log(res)
    // $('.link-container').append(res);
    // $('')
  })
}