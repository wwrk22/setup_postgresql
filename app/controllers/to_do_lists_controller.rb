class ToDoListsController < ApplicationController
  before_action :set_to_do_list, only: %i[ show edit update destroy ]
  before_action :set_to_do_list_all, only: %i[ index ]

  # GET /to_do_lists or /to_do_lists.json
  def index
  end

  # GET /to_do_lists/1 or /to_do_lists/1.json
  def show
  end

  # GET /to_do_lists/new
  def new
    @to_do_list = ToDoList.new
  end

  # GET /to_do_lists/1/edit
  def edit
  end

  # POST /to_do_lists or /to_do_lists.json
  def create
    @to_do_list = ToDoList.new(to_do_list_params)

    respond_to do |format|
      if @to_do_list.save
        format.html { redirect_to to_do_list_url(@to_do_list), notice: "To do list was successfully created." }
        format.json { render :show, status: :created, location: @to_do_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @to_do_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /to_do_lists/1 or /to_do_lists/1.json
  def update
    respond_to do |format|
      if @to_do_list.update(to_do_list_params)
        format.html { redirect_to to_do_list_url(@to_do_list), notice: "To do list was successfully updated." }
        format.json { render :show, status: :ok, location: @to_do_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @to_do_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /to_do_lists/1 or /to_do_lists/1.json
  def destroy
    @to_do_list.destroy

    respond_to do |format|
      format.html { redirect_to to_do_lists_url, notice: "To do list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # `find` can be summarized as:
    # 1. Convert the options (in this case the record ID) in to SQL statements.
    # 2. Execute the query and retrieve the records from DB.
    # 3. Instantiate Ruby-equivalent object for each record in the results from query execution.
    # 4. Run the `after_find` and `after_initialize` callbacks if any exist.
    def set_to_do_list
      @to_do_list = ToDoList.find(params[:id])
    end

    # Set conditions for queries WITHOUT using string interpolation in order
    # to prevent SQL injections.
    def set_to_do_list_all
      if params[:result] == 'filter'
        @to_do_lists = ToDoList.where(
          "id = :id AND name = :name",
          { id: params[:id], name: params[:name] }
        )
      else
        @to_do_lists = ToDoList.all
      end
    end

    # Only allow a list of trusted parameters through.
    def to_do_list_params
      params.require(:to_do_list).permit(:name)
    end
end
