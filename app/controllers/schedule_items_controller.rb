class ScheduleItemsController < ApplicationController
  before_action :set_schedule_item, only: %i[ show edit update destroy ]

  # GET /schedule_items or /schedule_items.json
  def index
    @schedule_items = ScheduleItem.all
  end

  # GET /schedule_items/1 or /schedule_items/1.json
  def show
  end

  # GET /schedule_items/new
  def new
    @schedule_item = ScheduleItem.new
  end

  # GET /schedule_items/1/edit
  def edit
  end

  # POST /schedule_items or /schedule_items.json
  def create
    @schedule_item = ScheduleItem.new(schedule_item_params)

    respond_to do |format|
      if @schedule_item.save
        format.html { redirect_to @schedule_item, notice: "Schedule item was successfully created." }
        format.json { render :show, status: :created, location: @schedule_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @schedule_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedule_items/1 or /schedule_items/1.json
  def update
    respond_to do |format|
      if @schedule_item.update(schedule_item_params)
        format.html { redirect_to @schedule_item, notice: "Schedule item was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @schedule_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @schedule_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedule_items/1 or /schedule_items/1.json
  def destroy
    @schedule_item.destroy!

    respond_to do |format|
      format.html { redirect_to schedule_items_path, notice: "Schedule item was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule_item
      @schedule_item = ScheduleItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def schedule_item_params
      params.require(:schedule_item).permit(:title, :start_time, :notes)
    end
end
