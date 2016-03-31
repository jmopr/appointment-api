require 'csv'

csv_text = File.read("appt_data.csv")
csv = CSV.parse(csv_text, :headers => true)
puts "processing appointment data....."
csv.each do |row|
  day_data = row["start_time"].split(" ")
  end_day_data = row["end_time"].split(" ")
  # t_year = day_data[0].split("/")[2]
  # year = "20" + t_year
  # t_date =

  appt_day = day_data[0].split("/").rotate(2).join("/")
  start_time = day_data[1]
  end_time = end_day_data[1]
  first_name = row["first_name"].capitalize
  last_name = row["last_name"].capitalize
  comments = row["comments"]

  Appointment.create(appt_day: appt_day, start_time: start_time, end_time: end_time, first_name: first_name, last_name: last_name,
              comments: comments)
end
