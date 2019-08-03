class NurseryTablesController < ApplicationController
  before_action :set_nursery_table, only: %i[show edit update destroy]

  # GET /nursery_tables
  # GET /nursery_tables.json
  def index
    @nursery_tables = NurseryTable.all
  end

  # GET /nursery_tables/1
  # GET /nursery_tables/1.json
  def show
  end

  # GET /nursery_tables/new
  def new
    @nursery_table = NurseryTable.new
  end

  # GET /nursery_tables/1/edit
  def edit
  end

  # POST /nursery_tables
  # POST /nursery_tables.json
  def create
    @nursery_table = NurseryTable.new(nursery_table_params)

    respond_to do |format|
      if @nursery_table.save
        format.html { redirect_to @nursery_table, notice: "Nursery table was successfully created." }
        format.json { render :show, status: :created, location: @nursery_table }
      else
        format.html { render :new }
        format.json { render json: @nursery_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nursery_tables/1
  # PATCH/PUT /nursery_tables/1.json
  def update
    respond_to do |format|
      if @nursery_table.update(nursery_table_params)
        format.html { redirect_to @nursery_table, notice: "Nursery table was successfully updated." }
        format.json { render :show, status: :ok, location: @nursery_table }
      else
        format.html { render :edit }
        format.json { render json: @nursery_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nursery_tables/1
  # DELETE /nursery_tables/1.json
  def destroy
    @nursery_table.destroy
    respond_to do |format|
      format.html { redirect_to nursery_tables_url, notice: "Nursery table was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_nursery_table
    @nursery_table = NurseryTable.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def nursery_table_params
    params.require(:nursery_table).permit(:capacity, :zone_id, :name)
  end
end
