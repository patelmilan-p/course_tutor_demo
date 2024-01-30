class Api::V1::CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def create
    @course = Course.create course_params

    if @course.valid?
      render status: :created
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :duration, :price,
                                   tutors_attributes: [:name, :title, :bio, :company])
  end
end
