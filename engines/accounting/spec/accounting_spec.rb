require 'spec_helper'

describe Accounting do
  class DummyListener
    def self.execute(_data); end
  end

  subject(:accounting) { described_class }

  let(:listener) { DummyListener }

  describe '.add_event_listener' do
    subject(:add_event_listener) { accounting.add_event_listener(event, listener) }

    let(:event) { :transfer_done }
    before { accounting.event_listeners[event] = [] }

    it {
      expect { add_event_listener }
        .to change { accounting.event_listeners[event] }
        .from([])
        .to(['DummyListener'])
    }
  end

  describe '.publish_event' do
    subject(:publish_event) { accounting.publish_event(:done_job, 42) }

    context 'when there are listeners' do
      before do
        accounting.add_event_listener(:done_job, listener)
      end
      after { accounting.event_listeners[:done_job] = [] }

      it 'sends the execution message to the listeners' do
        expect(listener).to receive(:execute).with(42)

        publish_event
      end
    end

    context 'when listeners is not configured' do
      it 'does not send the execution message to the listener' do
        expect(listener).to_not receive(:execute)

        publish_event
      end
    end
  end
end
