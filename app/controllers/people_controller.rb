class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show edit update destroy ]
  before_action :admin_only, only: %i[ edit update destroy ]
  skip_before_action :protect_pages, only: %i[ new create ]

  # GET /people or /people.json
  def index
    @people = Person.all
  end

  # GET /people/1 or /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
    @roles = Role.all
  end

  # GET /people/1/edit
  def edit
    @roles = Role.all
  end

  # POST /people or /people.json
  def create
    puts "Person params: #{person_params}"
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        @profile = Profile.new(person_id: @person.id, role_id: 2)
        @profile.save
        format.html { redirect_to @person, notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy!

    respond_to do |format|
      format.html { redirect_to people_path, status: :see_other, notice: "Person was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:name, :middle_name, :last_name, :second_last_name, :address, :phone, :email, :username, :password, :status)
    end
end
