class PatientsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.create({:first_name => params[:first_name], :last_name => params[:last_name], :date_of_birth => params[:date_of_birth]})

    # @patient_cancer = PatientCancer.create({:patient_id => patient.id})

    
    # puts @product.inspect
    # if @product.save && @product_category.save
    #   @new_product = Product.last
    #   flash[:success] = "This Product added"
    #   redirect_to "/products/#{@new_product.id}"
    # else
    #   flash[:message] = "Something was wrong with your form"
    #   render "new"
    # end

    flash[:success] = "Patient successfully add."
    redirect_to patients_path 
  end

  def update
  end

end
