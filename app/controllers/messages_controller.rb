class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @logged_in_user = current_user
    if params[:filter].blank?
      if @logged_in_user
        @messages = Message.order('created_at DESC')
      else
        @messages = Message.where(hidden: false).order('created_at DESC')
      end
    else
      my_ip = request.remote_ip
      if @logged_in_user
        @messages = Message.by_ip_address_admin(my_ip)
      else
        @messages = Message.by_ip_address(my_ip)
      end
    end
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @message.ip_address = request.remote_ip

    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_path, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def hide_message
    Message.update(params[:id], {:hidden => true})
    redirect_to messages_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:name, :entry, :ip_address)
    end
end
