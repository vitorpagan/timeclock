json.array!(@time_sheets) do |time_sheet|
  json.extract! time_sheet, :id, :closed_at, :user_id
  json.url time_sheet_url(time_sheet, format: :json)
end
