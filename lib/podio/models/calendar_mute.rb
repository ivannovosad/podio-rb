class Podio::CalendarMute < ActivePodio::Base
  property :id, :integer
  property :type, :string
  property :title, :string
  property :data, :hash
  property :item, :boolean
  property :status, :boolean
  property :task, :boolean

  class << self
    def find_all
      list Podio.connection.get('/calendar/mute/').body
    end

    def create(scope_type, scope_id, object_type = nil)
      path = "/calendar/mute/#{scope_type}/#{scope_id}/"
      path += "#{object_type}/" unless object_type.nil?
      Podio.connection.post(path).status 
    end

    def delete(scope_type, scope_id, object_type = nil)
      path = "/calendar/mute/#{scope_type}/#{scope_id}/"
      path += "#{object_type}/" unless object_type.nil?
      Podio.connection.delete(path).status
    end
  end
end
