class PostController < ApplicationController
  def new
    if request.post?

    end
  end

  #read by ID
  def read
    @post = Post.find(params[:id])
  end

  def update
    @post
  end

  def destroy
    Post.destroy(params[:id])
  end
end
q