module ChatsHelper
=begin
        def requested_friend()
                @all = Admin.find_all_by_chat_friend_name(current_admin.name_of_admin)
                @names = @all.map{|a| a.name_of_admin}
                return @names
        end
=end
end

