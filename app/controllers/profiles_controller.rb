class ProfilesController < ApplicationController

    # GET /profiles
    def index
        @profiles = Profile.all
        render json: @profiles, status: :ok
    end

    # POST /profiles
    def create
        @profile = Profile.create!(profile_params)
        render json: {status: 'created', data: @profile}
        #@profile = Profile.create!(profile_params)
        #render json: @profile, status: :created
    end

    # GET /profiles/:id
    def show
        json_response(@profile)
    end

    # PATCH /profiles/:id

    # PUT /profiles/:id
    def update
        @profile.update(profile)
        head :no_content
    end

    # DELETE /profiles/:id
    def destroy
        @profile.destroy
        head :no_content
    end
    

    private

    def profile_params
        # whitelist params
        params.permit(:user_id, :authentication_id, :username, :organization_name, 
                                    :address, :phone_number, :account_created_date)    
    end

    def set_profile
        @profile = Profile.find(params[:id])
    end

end