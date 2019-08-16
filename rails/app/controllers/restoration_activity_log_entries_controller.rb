class RestorationActivityLogEntriesController < ApplicationController
  before_action :set_restoration_activity_log_entry, only: %i[show edit update destroy]

  # GET /restoration_activity_log_entries
  # GET /restoration_activity_log_entries.json
  def index
    @restoration_activity_log_entries = RestorationActivityLogEntry.all
  end

  # GET /restoration_activity_log_entries/1
  # GET /restoration_activity_log_entries/1.json
  def show
  end

  # GET /restoration_activity_log_entries/new
  def new
    @restoration_activity_log_entry = RestorationActivityLogEntry.new(dive_id: params[:dive_id])
    @nursery_tables = NurseryTable.all
  end

  # GET /restoration_activity_log_entries/1/edit
  def edit
  end

  # POST /restoration_activity_log_entries
  # POST /restoration_activity_log_entries.json
  def create
    @restoration_activity_log_entry = RestorationActivityLogEntry.new(restoration_activity_log_entry_params)

    respond_to do |format|
      if @restoration_activity_log_entry.save
        format.html { redirect_to redirect_url(@restoration_activity_log_entry), notice: "Restoration activity log entry was successfully created." }
        format.json { render :show, status: :created, location: @restoration_activity_log_entry }
      else
        @nursery_tables = NurseryTable.all

        format.html { render :new }
        format.json { render json: @restoration_activity_log_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restoration_activity_log_entries/1
  # PATCH/PUT /restoration_activity_log_entries/1.json
  def update
    respond_to do |format|
      if @restoration_activity_log_entry.update(restoration_activity_log_entry_params)
        format.html { redirect_to @restoration_activity_log_entry, notice: "Restoration activity log entry was successfully updated." }
        format.json { render :show, status: :ok, location: @restoration_activity_log_entry }
      else
        format.html { render :edit }
        format.json { render json: @restoration_activity_log_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restoration_activity_log_entries/1
  # DELETE /restoration_activity_log_entries/1.json
  def destroy
    @restoration_activity_log_entry.destroy
    respond_to do |format|
      format.html { redirect_to restoration_activity_log_entries_url, notice: "Restoration activity log entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_restoration_activity_log_entry
    @restoration_activity_log_entry = RestorationActivityLogEntry.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def restoration_activity_log_entry_params
    params.require(:restoration_activity_log_entry).permit(:cleaned, :percent_filled, :bleached_corals, :dead_corals, :dive_id, :nursery_table_id, images: [])
  end

  def redirect_url(entry)
    if entry.dive_id
      dive_path(entry.dive_id)
    else
      @restoration_activity_log_entry
    end
  end
end
