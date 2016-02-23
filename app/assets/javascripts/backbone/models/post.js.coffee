class App.Models.Post extends Backbone.Model
	urlRoot: '/admin/posts/'
	paramRoot: 'post'

class App.Collections.PostsCollection extends Backbone.Collection
	model: App.Models.Post
	url: '/admin/posts'
