class Payments
  include HTTParty
  base_uri 'localhost:8080/payments'
  format :json
  headers 'Content-Type' => 'application/json'

  def registro_pagamento(payload)
    self.class.post('', body: payload.to_json)
  end

  def get_payments_by_id(id)
    self.class.get("/#{id}")
  end

  def generate_payload(buyer_payload, card_payload)
    Card.new.create_card(card_payload)
    Buyer.new.create_buyer(buyer_payload)
    payload = JSON.parse(File.read('./contracts/payments.json'))
    BaseActions.new.bulk_edit_payload(payload,
                                      "buyer": {
                                        "cpf": buyer_payload['cpf'],
                                        "email": buyer_payload['email'],
                                        "name": buyer_payload['name']
                                      },
                                      "payment": {
                                        "amount": rand(3000),
                                        "card": {
                                          "cvv": card_payload[:card][:cvv],
                                          "expirationDate": card_payload[:card][:expirationDate],
                                          "holderName": card_payload[:card][:holderName],
                                          "number": card_payload[:card][:number]
                                        },
                                        "type": 'CARD'
                                      })
  end
end
