json.array!(@submissions) do |submission|
  json.extract! submission, :id, :student_number, :site_url, :points
  json.url submission_url(submission, format: :json)
end
