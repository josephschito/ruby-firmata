require 'bundler/setup'
require 'firmata'

#sp = 'COM3' # windows
#sp = '/dev/ttyACM0' #linux
sp = '/dev/tty.usbmodemfa131' #mac

board = Firmata::Board.new(sp)

board.connect

puts "Firmware name #{board.firmware_name}"
puts "Firmata version #{board.version}"

pin_number = 2
rate = 0.5

board.on :digital_read do |pin, value|
  puts("#{pin}:#{value}")
end

board.on :digital_read_2 do |value|
  puts "Pin 2: #{value}"
end

board.set_pin_mode(pin_number, Firmata::PinModes::INPUT)
board.toggle_pin_reporting(pin_number)

while true do
	puts "waiting..."
	sleep 0.5
end
