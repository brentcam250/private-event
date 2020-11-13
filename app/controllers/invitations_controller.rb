class InvitationsController < ApplicationController
    before_action :set_event, only: [ :edit, :create ]
  

    def new
        @invitation = Invitation.new
    end

 
    # GET /invitations/1
    # GET /invitations/1.json
    def edit
      # puts "params:  #{params} "
      @event = Event.find(params[:id])
      unless (@event.nil?)
        @invitation = @event.invitations.build
        @invitation.attendee_id = params[:attendee_id]
      end
    
      # redirect_to "/events/#{params[:id]}"
    end


    def create
        #not sure if params hash has the actual event id in here... likely need to fix view to pass it properyl
        # puts "params:  #{params} "

        @event = Event.find(params[:id])
        @invitation = event.invitations.build
        # @invitation.invitation_time = DateTime.now
        # @invitation = invitation.new(invitation_params)
        # @invitation.user = User.find(session[:current_user_id])
    
        # @invitation.user = User.find(session[:current_user_id])
        respond_to do |format|
          if @invitation.save
            format.html { redirect_to @invitation, notice: 'invitation was successfully created.' }
            format.json { render :show, status: :created, location: @invitation }
          else
            format.html { render :new }
            format.json { render json: @invitation.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy

    end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:event_id])
    end

    # Only allow a list of trusted parameters through.
    def invitation_params
      params.require(:event).permit(:id)
    end
end
