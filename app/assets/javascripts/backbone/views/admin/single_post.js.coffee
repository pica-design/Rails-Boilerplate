class App.Views.SinglePostView extends Backbone.View
  template: JST['backbone/templates/admin/single_post']
  el: '.page-content .content'
  initialize: ->
    @listenTo @model, 'sync', @render
  render: ->
    console.log @model.toJSON()
    attachment = new App.Models.Attachment()
    @$el.html @template({attachment: attachment.toJSON(), model: @model.toJSON()})
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