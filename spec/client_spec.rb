describe 'Client Controller' do
  before(:all) do
    @client = Client.new
    @payload = { id: rand(1..100) }
  end

  it 'Cadastro de cliente válido', client: true do
    response = @client.create_client(@payload)
    expect(response.code).to eq(201)
  end

  it 'Cadastro de cliente já existente', client: true do
    response = @client.create_client(@payload)
    expect(response.code).to eq(404)
  end

  it 'Pesquisa cliente pelo id', client: true do
    response = @client.get_client_by_id(1)
    key = response.parsed_response
    expect(key['id']).to eq(1)
    expect(response.code).to eq(200)
  end
end
