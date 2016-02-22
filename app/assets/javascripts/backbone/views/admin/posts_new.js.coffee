class App.Views.Post extends Backbone.View
  template: -> $('.page-content').html();
  el: '.page-content'
  events:
    'click .publish': 'new_post'
    'click .update': 'update_post'

  initialize: ->
    # initialize dropzone to the upload element
    dropzone = new Dropzone('.upload',
      init: ->
        # when the image is completely uploaded to the server
        @on 'success', (file) ->
          # parse the response from rails
          file = JSON.parse(file.xhr.response);
          # render the image with the file JSON
          template = JST["backbone/templates/featured"](file)
          # render the template to the dropzone section
          $('.featured-image').html template
          # add the attachment ID to a hidden input so we can set it in the post
          $('input[name="attachment_id"]').val(file.attachment_info.id);
        return
      # only allow 1 upload on this page
      maxFiles: 1
      # for rails
      paramName: 'attachment[file]'
      addRemoveLinks: false
      # when the file gets accepted
      accept: (file, done) ->
          console.log("uploaded")
          done())
    # initialize the WYSIHTML5 element
    @content = $('#content')
    @content.wysihtml5({
      toolbar: {
        "font-styles": true,
        "emphasis": true,
        "lists": true,
        "html": true,
        "link": true,
        "image": true,
        "color": true,
        "blockquote": true,
        "size": 10
      }
    })
    @excerpt = $('#excerpt')
    @excerpt.wysihtml5({
      toolbar: {
        "font-styles": false,
        "emphasis": false,
        "lists": false,
        "html": false,
        "link": false,
        "image": false,
        "color": false,
        "blockquote": false,
        "size": 10
      }
    })
  new_post: ->
    new_post = {
      title: $('#title').val(),
      content: @content.val(),
      excerpt: @excerpt.val(),
      post_on: $('.date input').val(),
      status: $('#status').val(),
      categories: $("#multi").select2('val');
      attachment_id: $('input[name="attachment_id"]').val(),
      user_id: 1
      parent: 1
      menu_order: 10
      slug: slugify($('#title').val())
    }
    $.post '/admin/posts', new_post, ((response) ->
      console.log response.post.permalink
      location.href = "/admin/posts/" + response.post.permalink
      return),
      'json'
  update_post: ->
    update_post = {
      id: $('#post_id').val(),
      title: $('#title').val(),
      content: @content.val(),
      excerpt: @excerpt.val(),
      post_on: $('.date input').val(),
      status: $('#status').val(),
      categories: $("#multi").select2('val');
      attachment_id: $('input[name="attachment_id"]').val(),
      user_id: 1
      parent: 1
      menu_order: 10
    }
    $.ajax
      url: '/admin/posts/' + update_post.id,
      data: update_post
      dataType: 'json'
      converters: {
        "text json": jQuery.parseJSON
      }
      method: 'PUT'
      complete: (response) ->
        location.href = "/admin/posts/" + response.responseJSON.post.permalink + "/edit"