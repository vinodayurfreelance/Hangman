
require "yaml"

# Create some data
data = {
  name: "Vinod",
  age: 37
}

# Save the data to a YAML file
File.write("save.yml", data.to_yaml)

puts "Data saved successfully!"

# Load the data from the YAML file
loaded_data = YAML.load_file(
  "save.yml",
  permitted_classes: [Symbol]
)

# Display the loaded data
puts loaded_data[:name]
puts loaded_data[:age]
