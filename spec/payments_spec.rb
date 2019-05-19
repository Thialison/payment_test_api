describe 'Payments Controller' do
  before(:all) do
    @payments = Payments.new
    buyer = Buyer.new.generate_payload
    card = Card.new.generate_payload
    @payload = @payments.generate_payload(buyer, card)
  end

  it 'Realiza pagamento válido', payments: true do
    response = @payments.registro_pagamento(@payload)
    expect(response.code).to eq(200)
  end

  it 'Realiza pagamento com dados inválidos', payments: true do
    payload = JSON.parse(File.read('./contracts/payments.json'))
    response = @payments.registro_pagamento(payload)
    expect(response.code).to eq(404)
  end

  it 'Busca de pagamento por id inexistente', payments: true do
    response = @payments.get_payments_by_id(300)
    expect(response.body).to eq("Can't find payment with id: 300")
    expect(response.code).to eq(500)
  end

  it 'Valida contrado do busca pagamento pelo id', payments: true do
    response = @payments.get_payments_by_id(1)
    key = response.parsed_response
    expect(key['client']['id']).to be_a_kind_of(Integer)
    expect(key['buyer']['name']).to be_a_kind_of(String)
    expect(key['buyer']['email']).to be_a_kind_of(String)
    expect(key['buyer']['cpf']).to be_a_kind_of(String)
    expect(key['payment']['amount']).to be_a_kind_of(Float)
    expect(key['payment']['type']).to eq('CARD')
    expect(key['payment']['status']).to eq('COMPLETED')
    expect(key['payment']['card']['holderName']).to be_a_kind_of(String)
    expect(key['payment']['card']['number']).to be_a_kind_of(String)
    expect(key['payment']['card']['expirationDate']).to be_a_kind_of(String)
    expect(key['payment']['card']['cvv']).to be_a_kind_of(String)
    expect(response.code).to eq(200)
  end
end
