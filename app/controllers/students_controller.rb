# StudentsController implements CRUD operations (LO1: Framework Implementation)
# Demonstrates MVC pattern in Rails framework
class StudentsController < ApplicationController
  # Implements DRY principle by setting up student instance
  # before specific actions (LO1: Design Patterns)
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # Display all students with optional search functionality
  # Part of Read operation in CRUD
  def index
    @students = Student.all
    if params[:search].present?
      # Filter students by name if search parameter is provided
      @students = @students.where("name LIKE ?", "%#{params[:search]}%")
    end
  end

  # Show individual student details
  # Part of Read operation in CRUD
  def show
  end

  # Initialize new student instance for the form
  # Part of Create operation in CRUD
  def new
    @student = Student.new
  end

  # Display edit form for existing student
  # Part of Update operation in CRUD
  def edit
  end

  # Create new student record
  # Part of Create operation in CRUD
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        # Redirect to student page with success message if save is successful
        # Implements PRG pattern (Post/Redirect/Get)
        format.html { redirect_to student_url(@student), notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        # Re-render form with errors if save fails
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # Update existing student record
  # Part of Update operation in CRUD
  def update
    respond_to do |format|
      if @student.update(student_params)
        # Redirect to student page with success message if update is successful
        format.html { redirect_to student_url(@student), notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        # Re-render form with errors if update fails
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # Delete existing student record
  # Part of Delete operation in CRUD
  def destroy
    @student.destroy!

    respond_to do |format|
      # Redirect to students page with success message if deletion is successful
      format.html { redirect_to students_url, notice: "Student was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Find student by ID
    # Used by before_action filter
    # Implements student lookup by ID
    def set_student
      @student = Student.find(params[:id])
    end

    # Define allowed parameters for student creation/update
    # Implements strong parameters pattern
    # Security measure against mass assignment
    def student_params
      params.require(:student).permit(:name, :email, :student_number, :course)
    end
end
