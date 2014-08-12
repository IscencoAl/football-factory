class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :add_player]

  # GET /events
  # GET /events.json
  def index
    @events = Event.order(:start_time).all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @players = @event.players
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        flash[:success] = t('controllers.events.created')
        format.html { redirect_to events_url }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        flash[:success] = t('controllers.events.updated')
        format.html { redirect_to events_url }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: t('controllers.events.destroyed') }
      format.json { head :no_content }
    end
  end

  # GET /events/1/add_player
  def add_player
    @event_player = EventPlayer.new({:event_id => params[:id], :player_id => params[:player_id]})
    @player = Player.find_by_id(params[:player_id])
    @number = @event.players.count+1

    respond_to do |format|
      if @event_player.save
        format.js
      else
        format.js { render :add_player_error }
      end
    end
  end

  # GET /events/1/remove_player
  def remove_player
    @event_player = EventPlayer.where({:event_id => params[:id], :player_id => params[:player_id]}).take
    @event_player.destroy

    respond_to do |format|
      format.js
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :start_time, :end_time, :price)
    end
end
