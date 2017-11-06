require 'httparty'
require 'json'
require './lib/roadmap.rb'

  class Kele

    include HTTParty
    include Roadmap
        def initialize(email, password)
          @email = email
          @password = password
          @api_url = 'https://www.bloc.io/api/v1'
          auth_token = self.class.post(@api_url + '/sessions', body: {"email": email, "password": password})["auth_token"]

        end

        def get_me

          response = self.class.get(@api_url + '/users/me', headers: { "authorization" => @auth_token })
          JSON.parse(response.body)
        end

        def get_mentor_availability(mentor_id)
          response = self.class.get(@api_url + '/mentors/' + (mentor_id.to_s) +'/student_availability', headers: { "authorization" => @auth_token })
           JSON.parse(response.body)
        end




      end
