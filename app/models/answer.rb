class Answer < ActiveRecord::Base
        validates :question_id, :user_name, :user_answer, :presence => true
        belongs_to :question
        has_many :comments, :dependent => :destroy
        has_many :counters, :dependent => :destroy
        has_many :unlikes, :dependent => :destroy
end

