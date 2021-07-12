class VisitorsController < ApplicationController
  before_action :set_visitor, only: %i[ show edit update destroy ] 



  # GET /visitors or /visitors.json
  def index
    @visitors = current_user.visitors.visitors.all
  end
  
  # GET /visitors/1 or /visitors/1.json
  def show
  end

  # GET /visitors/new
  def new
    @visitor = Visitor.build
  end

  # GET /visitors/1/edit
  def edit
  end

  # POST /visitors or /visitors.json
  def create
    @visitor = current_user.visitors.build(link_params)

    respond_to do |format|
      if @visitor.save
        format.html { redirect_to @visitor, notice: "Link was successfully created." }
        format.json { render :show, status: :created, location: @visitor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @visitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visitors/1 or /visitors/1.json
  def update
    respond_to do |format|
      if @visitor.update(link_params)
        format.html { redirect_to @visitor, notice: "Link was successfully updated." }
        format.json { render :show, status: :ok, location: @visitor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @visitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visitors/1 or /visitors/1.json
  def destroy
    @visitor.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: "Link was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitor
      @visitor = visitors.find(params[:ip])
    end

    def set_user
      @user = current_user
    end

    # Only allow a list of trusted parameters through.
    def visitor_params
      params.require(:visitor).permit(:location, :user_agent, :ip, :platform, :link_id)
    end


end
