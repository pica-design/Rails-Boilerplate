class Admin::PostsController < Admin::BaseController
  before_action :set_admin_post, only: [:show, :edit, :update, :destroy]

  # GET /admin/posts
  # GET /admin/posts.json
  def index
    @posts = Post.all
  end

  # GET /admin/posts/1
  # GET /admin/posts/1.json
  def show

  end

  # GET /admin/posts/new
  def new
    @post = Post.new
  end

  # GET /admin/posts/1/edit
  def edit

  end

  # POST /admin/posts
  # POST /admin/posts.json
  def create
    @post = Post.new
    Array @post.attributes = {
      title: params[:title],
      excerpt: params[:excerpt],
      content: params[:content],
      status: params[:status],
      menu_order: params[:menu_order],
      attachment_id: params[:attachment_id],
      parent: params[:parent],
      post_on: Date.strptime(params[:post_on],"%m/%d/%Y").to_s
    }
    @post.generate_permalink!
    respond_to do |format|
      if (@post.save)
        format.html { redirect_to admin_post_url(@post), notice: 'Post was successfully created.' }
        format.json { render json: {
          :post => @post,
          # only send one because we can do a quick search replace to change the path
          # go to post_new_js BackBone
        }, status: :created}
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/posts/1
  # PATCH/PUT /admin/posts/1.json
  def update
    Array @post.attributes = {
      title: params[:post][:title],
      excerpt: params[:post][:excerpt],
      content: params[:post][:content],
      status: params[:post][:status],
      menu_order: params[:post][:menu_order],
      attachment_id: params[:post][:attachment_id],
      parent: params[:post][:parent],
      post_on: Date.strptime(params[:post][:post_on],"%m/%d/%Y").to_s
    }
    respond_to do |format|
      if (@post.save)
        format.json { render json: @post
          # only send one because we can do a quick search replace to change the path
          # go to post_new_js BackBone
        }
        format.html { redirect_to admin_post_url(@post.id), notice: 'Post was successfully updated.' }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/posts/1
  # DELETE /admin/posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to admin_posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_post
      if(params[:id].to_i > 0)
        @post = Post.find(params[:id])
      else
        @post = Post.find_by_permalink(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_post_params
      params.fetch(:admin_post, {})
    end
end
