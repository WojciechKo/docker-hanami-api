namespace 'trips' do
  post '/', to: 'trips#create'
end

namespace 'stats' do
  get '/weekly',  to: 'stats#weekly'
  get '/monthly', to: 'stats#weekly'
end
