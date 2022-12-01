class Earthling < ActiveRecord::Base
    has_many :visitations
    has_many :aliens, through: :visitations
    def full_name 
        #returns the combination of the human's first name and last name
        "#{self.first_name} #{self.last_name}"
    end
    def self.filter_by_job(newjob) 
        #takes in a job as a string and returns all earthlings with the specified job
        self.all.where(job:newjob)
    end
end
