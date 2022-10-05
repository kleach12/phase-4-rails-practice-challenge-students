class InstructorsController < ApplicationController
# rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
# rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def index 
    render json: Instructor.all 
  end

  def show
    instructor = find_instructor
    render json: find_instructor
  end

  def create
    instructor = Instructor.create!(instuctor_params)
    render json: instructor, status: :created
  end

  def update
    instructor = find_instructor
    instructor.update!(instuctor_params)
    render json: instructor
  end

  def destroy
    find_instructor.destroy
    head :no_content
  end

  private

  def find_instructor
    Instructor.find(params[:id])
  end

  def render_not_found_response(model)
    render json: {error: "#{model} not found"}, status: :not_found
  end

  # def render_unprocessable_entity_response(invalid)
  #   render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity 
  # end

  def instuctor_params
    params.permit(:name)
  end

end
