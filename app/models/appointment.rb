class Appointment < ActiveRecord::Base
  # validates :appt_day, presence: true
  # validates :start_time, presence: true
  # validates :end_time, presence: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # def self.get_all_data
  #   data = []
  #
  #   data
  # end
  #
  # scope :all, -> { all }
  # # scope :males, -> { where(gender: :male) }
  # # scope :all_employees, -> (year) { where(data_year: year) }
  # # scope :top_ten_salaries, -> { order(salary: :desc).limit(10) }
  #
  # # Returns a hash with the necessary data.
  # def self.get_all_data
  #   data = []
  #   year = 2012
  #   while (year <= 2016)
  #     data << get_data_for_year(year).merge({year: year})
  #     year += 1
  #   end
  #   return data
  # end
  #
  # # Returns an array of hashes with the average salary for both genders.
  # def self.get_data_for_year(year)
  #   return {
  #     men: all_employees(year).males.average(:salary).round(2),
  #     women: all_employees(year).females.average(:salary).round(2)
  #   }
  # end
end
