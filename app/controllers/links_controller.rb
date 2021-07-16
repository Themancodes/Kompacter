class LinksController < ApplicationController
  before_action :set_link, only: %i[ show edit update destroy ] 



  # GET /links or /links.json
  def index
    @links = current_user.links.all
  end

  def redirecting_screen
   @link = Link.find_by_ending(params[:ending]) 
   render 'errors/404', status: 404 if @link.nil?
   @link.update_attribute(:counter, @link.counter + 1)
   # redirect_to @link.url
  end

  # GET /links/1 or /links/1.json
  def redirect_to_link
    @link = Link.find_by_ending(params[:ending]) 
    render 'errors/404', status: 404 if @link.nil?
    @link.update_attribute(:counter, @link.counter + 1)
    render @link
    # redirect_to @link.url
  end
  
  # GET /links/1 or /links/1.json
  def show
  end

  # GET /links/new
  def new
    @link = current_user.links.build
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links or /links.json
  def create
    @link = current_user.links.build(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: "Link was successfully created." }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1 or /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: "Link was successfully updated." }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1 or /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: "Link was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = current_user.links.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    # Only allow a list of trusted parameters through.
    def link_params
      params.require(:link).permit(:title, :url, :user_id)
    end


end
