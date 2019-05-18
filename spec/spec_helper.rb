require 'httparty'
require 'faker'
require 'cpf_faker'
require 'pry'
Dir['./services/*.rb'].each { |file| require file }

class BaseActions
  def bulk_edit_payload(payload, *hash)
    hash[0].each { |k, v| payload[k] = v }
    payload
  end
end