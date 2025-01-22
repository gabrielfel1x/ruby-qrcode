require "rqrcode"

puts "Enter the link where you want the ruby-qrcode generator to generate the qr for you"
https = gets.strip
puts "Now enter the name of the file you want to save with the QR code in the /save folder"
file_name = gets.strip


qrcode = RQRCode::QRCode.new("#{https}")

# NOTE: showing with default options specified explicitly
png = qrcode.as_png(
  bit_depth: 1,
  border_modules: 4,
  color_mode: ChunkyPNG::COLOR_GRAYSCALE,
  color: "black",
  file: nil,
  fill: "white",
  module_px_size: 6,
  resize_exactly_to: false,
  resize_gte_to: false,
  size: 120 
)

IO.binwrite("saves/#{file_name}.png", png.to_s)

puts "Link entered: #{https}"
puts "File name entered: #{file_name}"

puts png.to_s