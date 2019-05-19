describe 'Buyer Controller' do
  before(:all) do
    @buyer = Buyer.new
    @payload = @buyer.generate_payload
  end

  it 'Cadastra buyer válido', buyer: true do
    response = @buyer.create_buyer(@payload)
    expect(response.code).to eq(201)
  end

  it 'Cadastra buyer com dados inválidos', buyer: true do
    response = @buyer.create_buyer({"cpf": 'string', "email": 'string'})
    expect(response.code).to eq(404)
  end

  it 'Valida contrato busca buyer pelo id', buyer: true do
    response = @buyer.get_buyer_by_id(1)
    key = response.parsed_response
    expect(key['name']).to be_a_kind_of(String)
    expect(key['email']).to be_a_kind_of(String)
    expect(key['cpf']).to be_a_kind_of(String)
    expect(response.code).to eq(200)
  end
end
