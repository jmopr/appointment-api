require 'csv'

csv_text = File.read("appt_data.csv")
csv = CSV.parse(csv_text, :headers => true)
puts "processing appointment data..."
appt_day_data = []
csv.each do |row|
  day_data = row["start_time"].split(" ")
  end_day_data = row["end_time"].split(" ")

  data = []
  appt_day = day_data[0].split("/").rotate(2)
  year = (day_data[0].split("/").rotate(2)[0].to_i + 2000).to_s
  appt_day = appt_day.drop(1).unshift(year).join("/")

  appt_end = appt_day + " " + end_day_data[1]
  appt_day = appt_day + " " + day_data[1]

  data << appt_day
  data << appt_end

  unless appt_day_data.include? data
    appt_day_data << data
    first_name = row["first_name"].capitalize
    last_name = row["last_name"].capitalize
    comments = row["comments"]

    Appointment.create(appt_day: appt_day, appt_end: appt_end, first_name: first_name, last_name: last_name,
    comments: comments)
  end
end
