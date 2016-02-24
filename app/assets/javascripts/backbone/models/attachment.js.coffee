class App.Models.Attachment extends Backbone.Model
  urlRoot: '/admin/attachments/'
  paramRoot: 'attachment'

class App.Collections.AttachmentsCollection extends Backbone.Collection
  model: App.Models.Attachment
  url: '/admin/attachments'
