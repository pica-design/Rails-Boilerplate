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

    @debug = admin_attachment_params
    @attachment = Attachment.new(admin_attachment_params)

    respond_to do |format|
      if @attachment.save
        format.html { redirect_to @attachment, notice: 'Attachment was successfully created.' }
        format.json { render :show, status: :created, location: @attachment }
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
      @params = params
      params.require(:attachment).permit(:file)
      params.fetch(:admin_attachment, {})
    end
end
