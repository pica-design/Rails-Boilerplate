class App.Views.NewPostView extends Backbone.View
  template: JST['backbone/templates/admin/single_post']
  el: '.page-content .content'
  events: ->
    "click .update": "update_post"
    "click .icon-custom-left": "go_back"
  initialize: ->
    @listenTo @model, 'sync', @render()
  render: ->

    # if @model.attachment_id != null
      # attachment = new App.Models.Attachment({id: @model.attributes.attachment_id})
      # attachment.fetch()
      # date = new Date(@model.attributes.post_on)
      # tweak the date so it display correctly
      # @model.attributes.post_on = (date.getMonth() + 1) + "/" + date.getDate() + "/" + date.getFullYear()
    # render the template with the attachment and model
    @$el.html @template({model: @model.toJSON()})
    if $('.upload').length
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
            done())

    # initiate the date selector
    $('.input-append.date').datepicker
      autoclose: true
      todayHighlight: true

    # start the categories selector
    $('#multi').select2({
      theme: "bootstrap"
    });
    # initiate the themes
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
  update_post: ->
    @model.set({
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
    })
    @model.save().success (data) ->
      $('#notice').css({
        'height': 0,
        'opacity': 0
        });
      $('#notice').html('
          <div class="alert alert-success">
            <button class="close" data-dismiss="alert"></button>
            Success:&nbsp;The <a href="#" class="link">post</a> has been updated. </div>')
      $("#notice").animate({height: '39px', opacity: 1},250);
  go_back: ->
    Backbone.history.navigate("/admin/posts", {trigger:true});
