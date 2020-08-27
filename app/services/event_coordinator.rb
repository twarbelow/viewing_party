require "google/api_client/client_secrets.rb"
require "google/apis/calendar_v3"

class EventCoordinator

  def client_configuration(user)
    client = Google::APIClient::ClientSecrets.new(
      { 'web' =>
        { 'access_token' => user.token,
          'refresh_token' => user.refresh_token,
          'client_id' => ENV['GOOGLE_CLIENT_ID'],
          'client_secret' => ENV['GOOGLE_CLIENT_SECRET']
          }
        }
    )
    #@client = client.to_authorization.refresh!
  #  @client.authorization.refresh!
    # @client.authorization.access_token = user.token
    # @client.authorization.refresh_token = user.refresh_token
    # @client.authorization.client_id = ENV['GOOGLE_CLIENT_ID']
    # @client.authorization.client_secret = ENV['GOOGLE_CLIENT_SECRET']
    # @client.authorization.refresh!
  end

  def calendar_event(user, party)
    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client_configuration(user).to_authorization
    #service.authorization.refresh!
    event = Google::Apis::CalendarV3::Event.new(
      description: "#{party.movie_title}",
      start: Google::Apis::CalendarV3::EventDateTime.new(
        date: "#{party.when}",
      ),
      end: Google::Apis::CalendarV3::EventDateTime.new(
        date: "#{party.when}"
      service.insert_event(event)
  end
end
