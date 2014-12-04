module EventsHelper
  def draw_order(event)
    participants = event.participants
    participants = participants.collect { |x| x }
    draw = []
    max_tries = 1000
    max_tries.times do
      participants.shuffle!
      draw = participants.zip(participants.rotate)
      if event.all_constraints_ok draw
        return draw
      end
    end
    nil
  end
end
