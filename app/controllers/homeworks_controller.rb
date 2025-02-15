class HomeworksController < ApplicationController
  before_action :authenticate_user!
  include ApplicationHelper

  def create
    @homework = Homework.new(homework_params)
    @homework.user_id = current_user.id if current_user
    if @homework.save
      redirect_to teacher_homeworks_path, notice: 'Домашнее задание успешно создано.'
    else
      redirect_to new_homework_path
      flash[:notice] = 'Формат загруженного файла не поддерживается или поле "Название" не может быть пустым'
    end
  end

  def new_homework
    @homework = Homework.new
    @homework.homework_files.build
    question = @homework.homework_questions.build
    question.homework_answers.build
  end
  
  def show_student_homework
    @new_homework_result = HomeworkResult.new
    @homework_assignment = HomeworkAssignment.find(params[:id])
    @homework = homework(@homework_assignment)
    @homework_type = @homework.type_homework

    homework_status = HomeworkStatus.find(@homework_assignment.homework_status_id)
    @status_name = homework_status.status
  end

  def homework_update
    @homework = Homework.find(params[:id])
    @homework.update_attribute(:is_deleted, true)
    
    redirect_to teacher_homeworks_path, notice: 'Успешно удалено.'
  end

  def assign
    @hw_assignment = HomeworkAssignment.new(assignment_params)
    if @hw_assignment.save
      redirect_to teacher_cabinet_path, notice: 'Домашнее задание успешно отправлено студенту.'
    else
      redirect_to :back, notice: 'Пожалуста выберите Студента и ДЗ обязательно !!!'
    end
  end

  def check
    @result = HomeworkResult.find(params[:id])
    assignment = HomeworkAssignment.find(@result.homework_assignment_id)
    if assignment.update(homework_status_id: 3)
      redirect_to accepted_homeworks_path, notice: 'Домашнее задание успешно проверенно.'
    else
      render teacher_cabinet_path
    end
  end

  def new_homework_question
    @homework = Homework.new
    question = @homework.homework_questions.build
    question.homework_answers.build
  end

  def create_homework_question
    @homework = Homework.new(homework_params)
    @homework.user_id = current_user.id if current_user
    if @homework.save
      redirect_to teacher_homeworks_path, notice: 'Домашнее задание успешно создано.'
    else
      render teacher_cabinet_path
    end
  end

  def show_homework
    @homework = Homework.find(params[:id])
    @type = @homework.type_homework
  end

  def record

  end

  def accepted_homeworks
    unchecked_homeworks = HomeworkAssignment.where(homework_status_id: 2)
    @unchecked_homeworks = []
    unchecked_homeworks.each do |unchecked_homework|
      if unchecked_homework.homework.user == current_user and unchecked_homework.user.teacher_id.to_i == current_user.id
        @unchecked_homeworks.push unchecked_homework
      end
    end
  end

  def update_hwassignment
    find_user = User.find(params[:id])
    homework_assignment = HomeworkAssignment.where(user_id: find_user)
    @update_hwassignment = HomeworkAssignment.find(params[:id])
    if @update_hwassignment.update(assignment_params)
      redirect_to :back, notice: 'Домашнее задание успешно завершенно'
    else
      render teacher_cabinet_path
    end
  end

  private

  def homework_params
    params.require(:homework).permit(:title, :is_deleted, :user_id, :type_homework,
                         homework_files_attributes: [:id,
                                              :description, 
                                              :file,
                                              :homework_id],
                         homework_questions_attributes: [:id, 
                                              :title, 
                                              :homework_id, 
                                              :_destroy,
                                              homework_answers_attributes: [:id, 
                                                                    :title, 
                                                                    :homework_question_id, 
                                                                    :_destroy, 
                                                                    :is_correct]])
  end

  def assignment_params
    params.require(:homework_assignment).permit(:user_id, :homework_id, :homework_status_id)
  end
end