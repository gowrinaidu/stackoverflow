class QuestionsController < ApplicationController
        before_filter :authenticate_admin!, :only => [:new, :points, :unlike]
        respond_to :js, :only=>[:points, :unlike, :tag_search]
        def index
             if params[:un_answered]
                questions = Question.all
                answers = Answer.all
                a_ids = []
                q_ids = []
                questions.each do |q|
                    q_ids << q.id
                end
                answers.each do |a|
                    a_ids << a.question_id
                end
                r_ids = q_ids - a_ids
                @q_subs = Question.find(:all, :conditions => ["id IN (?)", r_ids])
             else
                @q_subs = Question.all
             end
        end

        def new
                @question = Question.new
        end

        def create
                @question = Question.create(:admin_name => params[:question][:admin_name], :question_name => params[:question][:question_name], :subjects => params[:subject_tag])
                @error_messages = @question.errors.full_messages
                if @error_messages.blank?
                      subjects=params[:subject_tag].split(",")
                        subjects.each do |sub|
                             Subjectmodule.create!(:question_id => @question.id, :subject_name => sub)
                       end
                        redirect_to "/questions"
                else
                        @error_messages = @question.errors.full_messages
                        render :action=> "new"
                end
        end

         def points
                @n_points_id = params[:id]
                @counter = Counter.create!(:answer_id => params[:id])
                @no_of_points = Counter.find_all_by_answer_id(params[:id]).count
        end

        def unlike
                @n_points_id = params[:id]
                @counter = Unlike.create!(:answer_id => params[:id])
                @no_of_unlike_points = Unlike.find_all_by_answer_id(params[:id]).count
        end

        def full_view
                @questions = Question.all
        end

        def per_subject_questions
                subs = Subjectmodule.find_all_by_subject_name(params[:id])
                question_ids = []
                subs.each do |s|
                        question_ids << s.question_id
                end
                @q_subs = Question.find(:all, :conditions => ["id IN (?)", question_ids])
        end

        def tags
                @all_tags = Subjectmodule.all(:select => 'distinct subject_name')
        end

        def tag_search
                @all_tags = Subjectmodule.find(:all, :conditions => ["subject_name LIKE ?", "#{params[:search_tag]}%"], :select => 'subject_name, question_id')
                question_ids = []
                @all_tags.each do |sn|
                        question_ids << sn.question_id
                end
                if params[:search_tag].length > 0
                   @q_subs = Question.find(:all, :conditions => ["id IN (?)", question_ids])
                else
                   @q_subs = []
                end
        end

end

