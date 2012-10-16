class AnswersController < ApplicationController
        before_filter :authenticate_admin!, :only => [:update, :new]
        respond_to :js, :only => [:create_user_comment, :points, :update, :user_chance_question]

        def index
                @answers = Answer.all
        end

        def new
                @answer = Answer.new
        end

        def user_chance_question
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
                given_ids = q_ids - r_ids
                if params[:question_type] == "Un answered"
                        @questions = Question.find(:all, :conditions => ["id IN (?)", r_ids])
                        @qtype = "select question from unanswered"
                elsif params[:question_type] == "Answered"
                        @questions = Question.find(:all, :conditions => ["id IN (?)", given_ids])
                        @qtype = "select question from answered"
                else
                        @questions = Question.all
                end

        end

        def create
                @answer = Answer.create(params[:answer])
                @error_messages = @answer.errors.full_messages
                if @error_messages.blank?
                        redirect_to "/answers"
                else
                        @error_messages = @answer.errors.full_messages
                        render :action=> "new"
                end
        end

        def show
                @answer = Answer.find(params[:id])
                @comment = Comment.new
                @user_comments = Comment.find_all_by_answer_id(params[:id])
        end

        def update
               @answer = Answer.find(params[:id])
               @answer.update_attributes(params[:answer])
               @updateed_answer = Answer.find(params[:id]).user_answer
        end

        def create_user_comment
                @comment = Comment.create!(params[:comment])
                @user_comments = Comment.find_all_by_answer_id(params[:id])
                respond_with @user_comments.to_a.as_json
        end

end

