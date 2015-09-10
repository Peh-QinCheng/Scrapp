$(document).ready ->

  readURL = (input) ->
    if input.files and input.files[0]
      reader = new FileReader

      reader.onload = (e) ->
        target = $(input).data('target');
        console.log target
        $(target).attr 'src', e.target.result


      reader.readAsDataURL input.files[0]


  $('.file').change ->
    readURL this

