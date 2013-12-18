class PersonType < WashOut::Type
  map :name => :string, 
			:kind => :string,
			:location => :string,
			:id => :integer,
			:disabilities => [DisabilityType],
			:status => [StatusType]
end