class PatientsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @patient = Patient.new
  end

  def create
    cancer_list = Cancer.all
    @patient = Patient.create({:first_name => params[:first_name], :last_name => params[:last_name], :date_of_birth => params[:date_of_birth]})
    
    cancer_object = cancer_list.find_by(:type_of_cancer_id => params[:type_of_cancer_id])

    @patient_cancer = PatientCancer.create({:patient_id => @patient.id, :cancer_id => cancer_object.id})
    
    if @patient.save && @patient_cancer.save
      flash[:success] = "Patient successfully added."
      redirect_to patients_path
    else
      flash[:message] = "Something was wrong with your form"
      render "new"
    end

  end

  def update
  end

end
