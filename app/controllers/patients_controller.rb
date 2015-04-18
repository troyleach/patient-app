class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def show
    @patient        = Patient.find(params[:id])
    @patient_cancer = PatientCancer.where(:patient_id => params[:id])
  end

  def new
    @patient        = Patient.new
    @patient_cancer = PatientCancer.new
  end

  def create
    cancer_list = Cancer.all
    @patient = Patient.create({:first_name => params[:first_name], :last_name => params[:last_name], :date_of_birth => params[:date_of_birth]})
    
    cancer_object = cancer_list.find_by(:type_of_cancer_id => params[:type_of_cancer_id])


    @patient_cancer = PatientCancer.create({:patient_id => @patient.id, :cancer_id => cancer_object.id, :date_of_diagnosis => params[:date_of_diagnosis]})
 

    flash[:success] = "Patient successfully added."
    redirect_to patients_path


    # if @patient.save && @test.save
    #   flash[:success] = "Patient successfully added."
    #   redirect_to patients_path
    # else
    #   flash[:message] = "Something was wrong with your form"
    #   render "new"
    # end

  end

  def edit
    @patient        = Patient.find(params[:id])
    @patient_cancer = PatientCancer.where(:patient_id => params[:id])
  end

  def update
    @patient        = Patient.find(params[:id])
    @patient_cancer = PatientCancer.where(:patient_id => params[:id])
    p "patient_center below with DOD"
    p @patient_cancer
    
    cancer_type_id  = Cancer.find_by(:type_of_cancer_id => params[:type_of_cancer_id])

    p "what does this say just below"
    p cancer_type_id

    @patient.update({:first_name => params[:first_name], :last_name => params[:last_name], :date_of_birth => params[:date_of_birth]})

    @patient_cancer[0].update({:cancer_id => cancer_type_id.id, :date_of_diagnosis => params[:date_of_diagnosis]})

    flash[:success] = "Patient successfully updated."
    redirect_to patient_path(@patient.id)

  end

end
