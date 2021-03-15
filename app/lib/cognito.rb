class Cognito
    @client = Aws::CognitoIdentityProvider::Client.new(
      region: 'us-east-2',
      access_key_id: 'AKIAYUNQ3UXOHMTIQTOU',
      secret_access_key: '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',
    )

    def self.authenticate(user_object)
      auth_object = {
        user_pool_id: 'us-east-2_uNyN0zxh7',
        client_id: '3bqonrslfuhnl8srktgfk5gfca',
        auth_flow: 'ADMIN_NO_SRP_AUTH',
        auth_parameters: user_object,
      }
    
      return @client.admin_initiate_auth(auth_object)
    end

    def self.create_user(user_object)
      auth_object = {
        client_id: '3bqonrslfuhnl8srktgfk5gfca',
        username: user_object[:USERNAME],
        password: user_object[:PASSWORD],
        user_attributes: [
          {
            name: "given_name", 
            value: user_object[:FIRST_NAME],
          },
          {
            name: "family_name", 
            value: user_object[:LAST_NAME],
          },
        ],
      }
      begin 
        response = @client.sign_up(auth_object)
      rescue Exception => e
        return {success: false, response: e}
      else
        return {success: true, cognito_id: response[:user_sub]}
      end
    end
end