class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    if is_admin?
      get_messages(Message.all)
    else
      get_messages(visible_messages)
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:name, :entry, :ip_address)
    end

    def visible_messages
      Message.visible
    end

    def get_messages(messages)
      if params[:filter].blank?
        @messages = messages
      elsif params[:filter]
        name = params[:filter]
        @messages = messages.by_user_name(name)
      else
        my_ip = request.remote_ip
        @messages = messages.by_ip_address(my_ip)
      end
    end
end
