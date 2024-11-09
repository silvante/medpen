json.extract! client, :id, :name, :surname, :born_id, :from, :visiting_for, :paid, :diagnos, :date_of_visit, :created_at, :updated_at
json.url client_url(client, format: :json)
