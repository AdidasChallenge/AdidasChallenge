# Disable sending stats
ENV['COCOAPODS_DISABLE_STATS'] = 'true'

source 'https://cdn.cocoapods.org/'

platform :ios, '11.0'
use_frameworks!

def user_interface_pods
  # Layout
  pod 'EasyPeasy'
  
  # Image downloading and caching
  pod 'Nuke'
  
  # Animations
  pod 'lottie-ios'
end

def firebase_pods
    pod 'Firebase/Crashlytics'
end


def injection_pods
    pod 'Swinject'
    pod 'SwinjectAutoregistration'
end

def networking_pods
    pod 'Alamofire'
end


target 'AdidasChallenge' do

  # Pods for AdidasChallenge
  injection_pods
  firebase_pods
  
  target 'AdidasChallengeTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'AdidasChallengeUITests' do
    # Pods for testing
  end

end

# MARK: Presentation
target 'Presentation' do
  platform :ios, '11.0'
  injection_pods
  user_interface_pods
  
  # MARK: AppTests
  target 'PresentationTests' do
    inherit! :search_paths
  end
  
end

# MARK: Domain
target 'Domain' do
  platform :ios, '11.0'
  injection_pods
  
  # MARK: AppTests
  target 'DomainTests' do
    inherit! :search_paths
  end
  
end

# MARK: Data
target 'Data' do
  platform :ios, '11.0'
  networking_pods
  injection_pods
  
  # MARK: AppTests
  target 'DataTests' do
    inherit! :search_paths
  end
  
end
