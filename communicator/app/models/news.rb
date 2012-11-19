class News < ActiveRecord::Base
  belongs_to :dependence
  
  attr_accessible :admin, :description, :student, :teacher, :title, :validity, :dependence
end
