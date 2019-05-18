class Buyer
  include HTTParty
  base_uri 'localhost:8080/buyer'
  format :json
  headers 'Content-Type' => 'application/json'

  def create_buyer(payload)
    self.class.post('', body: payload.to_json)
  end

  def get_buyer_by_id(id)
    self.class.get("/#{id}")
  end

  def generate_payload
    payload = JSON.parse(File.read('./contracts/buyer.json'))
    BaseActions.new.bulk_edit_payload(payload,
                                      'cpf' => Faker::CPF.pretty,
                                      'email' => Faker::Internet.email,
                                      'name' => Faker::DcComics.villain)
  end
end
