require 'httparty'
require 'json'


  class Kele
    include HTTParty
        def initialize(username, password)
          @username = username
          @password = password
          @api_url = 'https://www.bloc.io/api/v1'
          @authentication_token = self.class.post(@api_url + '/sessions', body: {"email": "email", "password": "password"})

        end

        def get_me

          response = self.class.get(@api_url + '/users/me', headers: { "authorization" => @auth_token })
          JSON.parse(response.body)
        end
      end
