class Client
  include HTTParty
  base_uri 'localhost:8080/client'
  format :json
  headers 'Content-Type' => 'application/json'

  def create_client(payload)
    self.class.post('', body: payload.to_json)
  end

  def get_client_by_id(id)
    self.class.get("/#{id}")
  end
end
