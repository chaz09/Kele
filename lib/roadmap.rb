module Roadmap

def get_roadmap(roadmap_id)

  response = self.class.get(@api_url + '/roadmaps/' + (roadmap_id.to_s), headers: { "authorization" => @auth_token })
  JSON.parse(response.body)
end

def get_checkpoint(checkpoint_id)
  response = self.class.get(@api_url + '/checkpoints/' + (checkpoint_id.to_s), headers: { "authorization" => @auth_token })
   JSON.parse(response.body)
end

end
