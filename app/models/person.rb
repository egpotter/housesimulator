class Person < ActiveRecord::Base
	has_many :disabilities, :dependent => :destroy
	has_many :statuses, :dependent => :destroy, :order => :name
	belongs_to :room
	accepts_nested_attributes_for :statuses
	accepts_nested_attributes_for :disabilities, :allow_destroy => true
	validates :name, uniqueness: true, :presence => true
	validates :kind, :presence => true
	after_create :create_statuses

	def self.update_locations
		self.all.each { |p| p.change_location}
	end 

	def change_location
		if Simulation.started?
			pl = Room.all.map{|r| r.id}
			pl<<0 if self.kind != "Patient"
			new_location = pl[rand(pl.length)]
			if new_location != self.room_id
				Log.create(:description => "#{self.name} has changed from #{self.room_id != 0 ? self.room.name : 'not at home'} to #{new_location != 0 ? Room.find(new_location).name : 'not at home'}", :kind => 6)
				self.room_id = new_location
				self.save
			end
		end
	end 

	def self.disabilities_array
		[["Select Disability", ""], "Visual", "Hearing", "Cognitive", "Motor"]
	end

	def self.kinds_array
		[["Select kind", ""], "Patient", "Caregiver", "Visitor", "Doctor"]
	end

	def get_data
		disabilities_array = []
		self.disabilities.each do |d|
			disabilities_array << d.get_data
		end
		status_array = []
		self.statuses.each do |d|
			status_array << d.get_data
		end
		{
			name: self.name,
			kind: self.kind,
			location: self.room ? self.room.name : "not at home",
			id: self.id,
			disabilities: disabilities_array,
			status: status_array
		}
	end

	def create_statuses
		if self.kind == "Patient"
			Status.create(person_id: self.id, name: 'agitation', value: 'none')
			Status.create(person_id: self.id, name: 'glucose_level', value: 'low')
			Status.create(person_id: self.id, name: 'temperature', value: 'low')
			Status.create(person_id: self.id, name: 'spinal_injury', value: 'false')
			Status.create(person_id: self.id, name: 'stroke', value: 'false')
			Status.create(person_id: self.id, name: 'shock', value: 'false')
			Status.create(person_id: self.id, name: 'dehydration', value: 'false')
			Status.create(person_id: self.id, name: 'diabetes_complication', value: 'false')
			Status.create(person_id: self.id, name: 'asthma_attack', value: 'false')
		end
	end
end
