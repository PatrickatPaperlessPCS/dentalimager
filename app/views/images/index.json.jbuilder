json.array!(@images) do |image|
  json.extract! image, :id, :patient_name, :patient_id, :image_desc, :dob
  json.url image_url(image, format: :json)
end
