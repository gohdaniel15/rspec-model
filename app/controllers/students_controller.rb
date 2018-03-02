class StudentsController < ApplicationController

  def index
    @students = Student.all
    # instance_variable is assigned to array containing students
  end

  def show
    @student = Student.find(params[:id])
    # instance_variable is assigned to an instance of a student
  end

  def new
    @student = Student.new
    # instance_variable is assigned to a new instance of a Student
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
    else
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to students_path
    else
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email,
                                    :github_url, :twitter_url, :birth_date)
  end

end
