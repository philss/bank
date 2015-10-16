require "accounting/engine"

module Accounting
  class << self
    def event_listeners
      @event_listeners ||= Hash.new([])
    end

    # Adds a new event listener.
    # Listener should be a constant or a string representing a constant,
    # and that class/module must respond to `.execute`.
    def add_event_listener(event, listener)
      event_listeners[event] << listener.to_s
    end

    def publish_event(event, *args)
      event_listeners[event].map do |listener|
        Object.const_get(listener).execute(*args)
      end
    end
  end
end
