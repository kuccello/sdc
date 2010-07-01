require 'dirge'
require ~'../lib/sdc'

#SDC.api(false,'GeneralSearch',{:keyword=>"paintball"})

api_key = 'authorized-key'
token_id = '7000610'
sandbox = true

client = SDC::Client.new(api_key,token_id,sandbox)
r = client.respond 'GeneralSearch', {:keyword=>"paintball"}

puts "#{__FILE__}:#{__LINE__} [#{__method__}] Response: #{r.class.name}"


r = client.respond 'CategoryTree', {}

puts "#{__FILE__}:#{__LINE__} [#{__method__}] Response: #{r.class.name}"

r = client.respond 'CategoryTree', {:showAllDescendants => 'true'}

puts "#{__FILE__}:#{__LINE__} [#{__method__}] Response: #{r.class.name}"
