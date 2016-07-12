class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authenticate_user, :except => [:index, :new, :create, :update]
  # GET /images
  # GET /images.json
  def index
      if current_user.created_at <= 1.week.ago && !current_user.subscribed
        redirect_to new_charge_path
    else
    @images = current_user.images.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @image = Image.find(params[:id])
    # @image = Image.find_by(token: params[:token], id: params[:id])
  end

  def share
  end

  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)


    respond_to do |format|
      if @image.save
        # ImagesMailer.email(@image).deliver_later
        format.html { redirect_to root_path, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:patient_name, :patient_id, :image_desc, :dob, :image_file, :user_name, :token, :user_id, :recipient)
    end
end
