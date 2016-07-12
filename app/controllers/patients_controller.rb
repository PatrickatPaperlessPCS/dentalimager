class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /patients
  # GET /patients.json
  def index
     @patients = current_user.patients.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)

  end


  # GET /patients/1
  # GET /patients/1.json
  def show
    @patient = Patient.find(params[:id])
    @images = @patient.images
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
    # @image = @patient.images.build
    @patient = Patient.find(params[:id])
    @image = Image.new
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)
    @patient.user_id = current_user.id
    respond_to do |format|
      if @patient.save
        format.html { redirect_to edit_patient_path(@patient), notice: 'Patient Folder was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient Folder was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:name, :token, :email, images_attributes: [:id, :description, :done, :_destroy, :patient_name, :patient_id, :image_desc, :dob, :image_file, :user_name, :token, :user_id, :recipient])
      # params.require(:patient).permit(:name, :token, :email) - commented out for above to accept nested deletions
    end
end
