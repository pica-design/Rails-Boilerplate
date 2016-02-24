class Admin::AttachmentsController < Admin::BaseController
  before_action :set_admin_attachment, only: [:show, :edit, :update, :destroy]

  # GET /admin/attachments
  # GET /admin/attachments.json
  def index
    @attachments = Attachment.all
  end

  # GET /admin/attachments/1
  # GET /admin/attachments/1.json
  def show
  end

  # GET /admin/attachments/new
  def new
    @attachment = Attachment.new
  end

  # GET /admin/attachments/1/edit
  def edit
  end

  # POST /admin/attachments
  # POST /admin/attachments.json
  def create
    # create a new attachment
    @attachment = Attachment.new(admin_attachment_params)
    @attachment.file = params[:attachment][:file]
    Array @attachment.attributes = {
      file_file_name: params[:attachment][:file].original_filename,
      title: params[:attachment][:file].original_filename,
      post_id: 1,
      user_id: 1,
      page_id: 1,
      parent: 1,
      status: 'draft',
      menu_order: 1
    }
    respond_to do |format|
      if @attachment.save
        format.js
        format.html { redirect_to admin_attachment_url(@attachment), notice: 'Attachment was successfully created.' }
        # here is the magic to get the response
        # lets respond to the post request with
        # • JSON: @attachment, file, file, URL
        format.json { render json: {
          :attachment_info => @attachment,
          :file => @attachment.file,
          # only send one because we can do a quick search replace to change the path
          # go to post_new_js BackBone
          :url => @attachment.file.url(:thumb)
        }, status: :created, location: admin_attachment_url(@attachment) }
      else
        format.html { render :new }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/attachments/1
  # PATCH/PUT /admin/attachments/1.json
  def update
    respond_to do |format|
      if @attachment.update(admin_attachment_params)
        format.html { redirect_to @attachment, notice: 'Attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @attachment }
      else
        format.html { render :edit }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/attachments/1
  # DELETE /admin/attachments/1.json
  def destroy
    @attachment.destroy
    respond_to do |format|
      format.html { redirect_to admin_attachments_url, notice: 'Attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_attachment
      @attachment = Attachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_attachment_params
      params.require(:attachment).permit(:file) if params[:attachment]
      params.fetch(:admin_attachment, {})
    end
end
