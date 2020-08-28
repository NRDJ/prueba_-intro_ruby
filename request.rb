require "uri"
require "net/http"
require 'openssl'
require 'json'

def request(address)

    url = URI(address)

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_PEER

    request = Net::HTTP::Get.new(url)

    response = https.request(request)

    if response.code.to_i >= 200 && response.code.to_i <= 299
        return JSON.parse(response.read_body)
    else
        return nil
    end
end

