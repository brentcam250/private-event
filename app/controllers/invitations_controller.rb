class InvitationsController < ApplicationController

    def new
        @invitation = Invitation.new
    end

 
    # GET /invitations/1
    # GET /invitations/1.json
    def edit
      @event = Event.find(params[:id])
      unless (@event.nil?)
        @invitation = @event.invitations.build
        @invitation.attendee_id = params[:attendee_id]
      end
    
      # redirect_to "/events/#{params[:id]}"
    end


    def create
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

end
