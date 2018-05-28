class CoursesController < ApplicationController

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      #redirect_to @course
      render 'edit'
    else
      render misc_error_path
      #render 'new_course_path'
    end
  end

  def index
    #@courses = Course.all

    #ViewのFormで取得したパラメータをモデルに渡す
    @courses = Course.search(params[:search])
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      #redirect_to @course
      render 'edit'
    else
      render 'edit'
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    render 'destroy'
  end

  private
    def course_params
      params.require(:course).permit(:course_id, :course_title, :topic, :day_length, :price, :level_id, :category)
    end
end
