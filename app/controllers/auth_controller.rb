lass AuthController < ApplicationController
    def sign_in
      user_object = {
        USERNAME: params[:email],
        PASSWORD: params[:password],
      }
      begin
        resp = Cognito.authenticate(user_object).authentication_result
      rescue Exception => e
        render json: {success: false, response: e}
      else
        profile = Profile.find_by(username: params[:email])
        render json: {success: true, response: resp, profile: profile}
      end
    end


    def sign_up
      # register user in cognito
      response = Cognito.create_user(
        {
          USERNAME: params[:email],
          PASSWORD: params[:password],
          FIRST_NAME: params[:first_name],
          LAST_NAME: params[:last_name],
        }
      )

      if(response[:success])
        cognito_id = response[:cognito_id]
        # save user to database
        db_response = Profile.create!(
          {
            authentication_id: cognito_id,
            username: params[:email],
            first_name: params[:first_name],
            last_name: params[:last_name],
          }
        )
        render json: {success: true, profile: db_response}
      else
        render json: response
      end


    end
end