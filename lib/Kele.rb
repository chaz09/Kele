require 'httparty'
require 'json'
require './lib/roadmap.rb'

  class Kele

    include HTTParty
    include Roadmap

    def initialize(email, password)
      @api_url = 'https://www.bloc.io/api/v1'
      @auth_token = self.class.post(@api_url + '/sessions', body: {"email": email, "password": password})["auth_token"]
    end

    def get_me
      response = self.class.get(@api_url + '/users/me', headers: { "authorization" => @auth_token })
      JSON.parse(response.body)
    end

    def get_mentor_availability(mentor_id)
      response = self.class.get(@api_url + '/mentors/' + (mentor_id.to_s) + '/student_availability', headers: { "authorization" => @auth_token })
      JSON.parse(response.body)
    end


    def get_messages(page)
			response = self.class.get(@api_url + '/message_threads' + "?page=#{page}", headers: {"authorization" => @auth_token})
      JSON.parse(response.body)

	   end


      def create_message(user_id, recipient_id, token, subject, stripped_text)
        response = self.class.get(@api_url + '/messages',
        body: {
          "user_id": user_id,
          "recipent_id": recipent_id,
          "token": token,
          "subject": subject,
          "stripped_text": message
        },

        headers: { "authorization" => @auth_token })
        JSON.parse(response.body)
      end

      def create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment)
        checkpoint_id = 2322
          response = self.class.get(@api_url + '/checkpoint_submissions',
          body: {
            "assignment_branch": assignment_branch,
            "assignment_commit_link": assignment_commit_link,

            "comment": comment,

          },

           headers: { "authorization" => @auth_token})
             JSON.parse(response.body)

    end
end
