class Hipstandup
  # setup like: "room1:user1,user2 room2:user2,user3,user4"
  def self.parse_setup(raw)
    raw.strip.split(/\s+/).inject({}) do |setup, block|
      room, people = block.split(":", 2)
      setup[room] = people.split(",")
      setup
    end
  end

  def initialize(token)
    @api = HipChat::API.new(token)
  end

  def notify(room, people)
    msg_people = people.map { |name| "@#{name}" }.join(" ")
    @api.rooms_message(room, "HipStandup", "Friendly reminder to talk to each other: #{msg_people}", 1, "yellow", "text")
  end
end