class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy ]

  # GET /clients or /clients.json
  def index
    @clients = Client.all
  end

  # GET /clients/1 or /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
    @types = Type.pluck(:title, :id)
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients or /clients.json
  def create
    client_params[:visiting_for].reject!(&:blank?) if client_params[:visiting_for].is_a?(Array)
    @client = Client.new(client_params)

  # Filter out any blank values and assign the Type IDs to `type_ids` for association
  # if client_params[:visiting_for].present?
  #   @client.type_ids = client_params[:visiting_for].reject(&:blank?)
  # end

  # @client.visiting_for = client_params[:visiting_for].map(&:to_i) if client_params[:visiting_for].present?

  respond_to do |format|
    if @client.save
      format.html { redirect_to @client, notice: "Client was successfully created." }
    else
      format.html { render :new }
    end
  end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: "Client was successfully updated." }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    @client.destroy!

    respond_to do |format|
      format.html { redirect_to clients_path, status: :see_other, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def this_day
    @clients = Client.where(date_of_visit: Time.zone.today.all_day)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:name, :surname, :born_id, :from, :paid, :diagnos, :date_of_visit, visiting_for: [])
    end
end
