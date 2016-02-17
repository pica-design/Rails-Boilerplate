class AdminController < ApplicationController
  def index
    render layout: "/layouts/admin"
  end

  def updates
    # render "/admin/updates"
  end

  def users
    @users = User.all
  end

  def settings
  end

  def posts
    @posts = Post.all
  end
end
