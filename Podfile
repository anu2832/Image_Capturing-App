# Set the minimum platform version for your project
platform :ios, '13.0' # or your desired minimum iOS version

target 'ImageCapturingApp' do
  # Use dynamic frameworks
  use_frameworks!

  # Add the RealmSwift pod
  pod 'RealmSwift', '~> 10.38'

  target 'ImageCapturingAppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ImageCapturingAppUITests' do
    inherit! :search_paths
    # Pods for UI testing
  end

end
