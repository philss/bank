# Configuration of the Accounting subsystem goes here.
Accounting.add_event_listener(:transfer_done, 'Accounting::TransferDoneListener')
