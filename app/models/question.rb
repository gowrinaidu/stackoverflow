class Question < ActiveRecord::Base
        validates :admin_name, :question_name, :presence => true
        has_many :answers, :dependent => :destroy
        has_many :subjectmodules, :dependent => :destroy
end

