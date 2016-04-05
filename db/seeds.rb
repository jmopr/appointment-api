require 'csv'

csv_text = File.read("appt_data.csv")
csv = CSV.parse(csv_text, :headers => true)
puts "processing appointment data....."
appt_day_data = []
csv.each do |row|
  day_data = row["start_time"].split(" ")
  end_day_data = row["end_time"].split(" ")

  data = []
  appt_day = day_data[0].split("/").rotate(2).join("/")
  start_time = day_data[1]
  end_time = end_day_data[1]
  data << appt_day
  data << start_time
  data << end_time

  unless appt_day_data.include? data
    appt_day_data << data
    first_name = row["first_name"].capitalize
    last_name = row["last_name"].capitalize
    comments = row["comments"]

    Appointment.create(appt_day: appt_day, start_time: start_time, end_time: end_time, first_name: first_name, last_name: last_name,
    comments: comments)
  end
end


# require 'csv'
# appointments = CSV.read('appt_data.csv')
# headers = appointments.shift
#
# i= 1
# appointments.each do |appointment|
#   start_date = appointment[0].split(" ").first.split("/")
#   start_date= "#{start_date[2]}-#{start_date[0]}-#{start_date[1]}"
#   start_date.insert(0, "0")
#   start_date.insert(0, "2")
#   start_time = appointment[0].split(" ").last
#   start_time.insert(-1, ":")
#   start_time.insert(-1, "0")
#   start_time.insert(-1, "0")
#   end_date =  appointment[1].split(" ").first.split("/")
#   end_date= "#{end_date[2]}-#{end_date[0]}-#{end_date[1]}"
#   end_date.insert(0, "0")
#   end_date.insert(0, "2")
#   end_time = appointment[1].split(" ").last
#   end_time.insert(-1, ":")
#   end_time.insert(-1, "0")
#   end_time.insert(-1, "0")
#   first_name =  appointment[2]
#   last_name = appointment[3]
#   comments = appointment[4]
#   Appointment.create(first_name: first_name, last_name: last_name, start_time: "#{start_date} #{start_time}",  end_time: "#{end_date} #{end_time}", comment: comments)
#   puts i
#   i += 1
# end
