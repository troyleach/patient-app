class PatientCancer < ActiveRecord::Base
  belongs_to  :patient
  belongs_to  :cancer
end
