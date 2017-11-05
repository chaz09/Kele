
require 'httparty'

      class Kele
        include HTTParty

        def initialize(username, password)
          @username = username
          @password = password
          @api_url = ' https://www.bloc.io/api/v1'
          @authentication_token = self.class.post(@api_url + '/sessions', body: {"email": "email", "password": "password"})

        end
      end



end
