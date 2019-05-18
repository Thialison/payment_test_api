class Card
  include HTTParty
  base_uri 'localhost:8080/card'
  format :json
  headers 'Content-Type' => 'application/json'

  def create_card(payload)
    self.class.post('', body: payload.to_json)
  end

  def get_card_by_id(id)
    self.class.get("/#{id}")
  end

  def validate_card(payload)
    self.class.post('/validate', body: payload.to_json)
  end

  def generate_payload
    payload = JSON.parse(File.read('./contracts/card.json'))
    BaseActions.new.bulk_edit_payload(payload,
                                      "card": {
                                        "cvv": rand(100..999),
                                        "expirationDate": '2023-11-16',
                                        "holderName": Faker::JapaneseMedia::DragonBall.character,
                                        "number": Faker::Number.number(16)
                                      })
  end
end
