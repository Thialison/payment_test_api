describe 'Card Controller' do
  before(:all) do
    @card = Card.new
    @payload = @card.generate_payload
  end

  it 'Realiza POST de um card válido', card: true do
    response = @card.create_card(@payload)
    expect(response.code).to eq(201)
  end

  it 'Realiza POST de um card inválido', card: true do
    response = @card.create_card("cpf": 'string', "email": 'string')
    expect(response.code).to eq(404)
  end

  it 'Valida card existente', card: true do
    response = @card.validate_card(@payload[:card][:number])
    expect(response.code).to eq(200)
  end

  it 'Retorna erro ao validar card inexistente', card: true do
    response = @card.validate_card("number": '2933869852083886')
    expect(response.body).to eq("Can't find card with number: 2933869852083886")
    expect(response.code).to eq(500)
  end

  it 'Validar contrato do card', card: true do
    response = @card.get_card_by_id(5)
    key = response.parsed_response
    expect(key['holderName']).to be_a_kind_of(String)
    expect(key['number']).to be_a_kind_of(String)
    expect(key['expirationDate']).to be_a_kind_of(String)
    expect(key['cvv']).to be_a_kind_of(String)
    expect(response.code).to eq(200)
  end
end
