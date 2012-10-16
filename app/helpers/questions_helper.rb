module QuestionsHelper
        def no_of_points(pid)
                @no_of_points = Counter.find_all_by_answer_id(pid).count
                return @no_of_points
        end

        def no_of_unlike_points(pid)
                @no_of_unlike_points = Unlike.find_all_by_answer_id(pid).count
                return @no_of_unlike_points
        end
end

