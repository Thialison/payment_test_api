describe 'Card Controller' do
  before(:all) do
    @card = Card.new
    @payload = @card.generate_payload
  end

  it 'Cadastro de cartão válido', card: true do
    response = @card.create_card(@payload)
    expect(response.code).to eq(201)
  end

  it 'Cadastro de cartão com vencimento antes da data atual', card: true do
    response = @card.create_card({
      "buyerId": 1,
      "card": {
      "cvv": rand(100..999),
      "expirationDate": '2010-11-16',
      "holderName": Faker::JapaneseMedia::DragonBall.character,
      "number": Faker::Number.number(16)
    }})
    expect(response.code).to eq(404)
  end

  it 'Valida cartão existente', card: true do
    response = @card.validate_card(@payload[:card][:number])
    expect(response.code).to eq(200)
  end

  it 'Retorna erro ao validar cartão inexistente', card: true do
    response = @card.validate_card("number": '2933869852083886')
    expect(response.body).to eq("Can't find card with number: 2933869852083886")
    expect(response.code).to eq(500)
  end

  it 'Valida contrato do busca dados do cartão de pelo id', card: true do
    response = @card.get_card_by_id(1)
    key = response.parsed_response
    expect(key['holderName']).to be_a_kind_of(String)
    expect(key['number']).to be_a_kind_of(String)
    expect(key['expirationDate']).to be_a_kind_of(String)
    expect(key['cvv']).to be_a_kind_of(String)
    expect(response.code).to eq(200)
  end
end
