class PluginsController < ApplicationController
  before_action :set_plugin, only: [:show, :edit, :update, :destroy]

  # GET /plugins
  # GET /plugins.json
  def index
    if params[:name].present?
      @plugins = Plugin.where('name like ?', "%#{params[:name]}%")
    else
      @plugins = Plugin.all
    end
  end

  # GET /plugins/1
  # GET /plugins/1.json
  def show
  end

  # GET /plugins/new
  def new
    @plugin = Plugin.new
  end

  # GET /plugins/1/edit
  def edit
  end

  # POST /plugins
  # POST /plugins.json
  def create
    @plugin = Plugin.new(plugin_params)

    respond_to do |format|
      if @plugin.save
        format.html { redirect_to @plugin, notice: 'Plugin was successfully created.' }
        format.json { render :show, status: :created, location: @plugin }
      else
        format.html { render :new }
        format.json { render json: @plugin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plugins/1
  # PATCH/PUT /plugins/1.json
  def update
    respond_to do |format|
      if @plugin.update(params.require(:plugin).permit(:name, :version, :author, :category_id, :description))
        if params[:new_images].present?
          for image_obj in params.require(:new_images) do
            @plugin.plugin_images.new(image_obj.permit(:url)).save
          end
          # @plugin.plugin_images.build(params.require(:new_images))
        end
        format.html { redirect_to @plugin, notice: 'Plugin was successfully updated.' }
        format.json { render :show, status: :ok, location: @plugin }
      else
        format.html { render :edit }
        format.json { render json: @plugin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plugins/1
  # DELETE /plugins/1.json
  def destroy
    @plugin.destroy
    respond_to do |format|
      format.html { redirect_to plugins_url, notice: 'Plugin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plugin
      @plugin = Plugin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plugin_params
      params.require(:plugin).permit(:name, :author, :description, :version)
    end
end
