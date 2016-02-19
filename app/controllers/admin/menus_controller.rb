class Admin::MenusController < Admin::BaseController
  before_action :set_admin_menu, only: [:show, :edit, :update, :destroy]

  # GET /admin/menus
  # GET /admin/menus.json
  def index
    @menus = Menu.all
  end

  # GET /admin/menus/1
  # GET /admin/menus/1.json
  def show
  end

  # GET /admin/menus/new
  def new
    @menu = Menu.new
  end

  # GET /admin/menus/1/edit
  def edit
  end

  # POST /admin/menus
  # POST /admin/menus.json
  def create
    @menu = Menu.new(admin_menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to admin_menus_url, notice: 'Menu was successfully created.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/menus/1
  # PATCH/PUT /admin/menus/1.json
  def update
    respond_to do |format|
      if @menu.update(admin_menu_params)
        format.html { redirect_to @menu, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/menus/1
  # DELETE /admin/menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to admin_menus_url, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_menu_params
      params.fetch(:admin_menu, {})
    end
end
