module EventsHelper
  def draw_order(event)
    participants = event.participants
    participants = participants.collect { |x| x }
    participants.shuffle!
    participants.zip(participants.rotate)
  end
end
