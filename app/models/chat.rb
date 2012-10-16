class Chat < ActiveRecord::Base
        validates :sender_name, :presence => true
end

