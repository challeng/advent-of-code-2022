require 'net/http' 

day = ARGV[0]
if day.nil?
  puts 'Forgot to put a date!'
  return
end

system("mkdir #{day}")
File.open("#{day}/#{day}.rb", 'w') do |f|     
  f.write("""class Day#{day}
  def initialize(file)
    @inputs = parse_file(file)
  end

  def part_one
  end

  def part_two
  end

  def parse_file(file)
    File.readlines(file, chomp: true).map do |line, i|
    end
  end
end
  """)
end

File.open("#{day}/#{day}_spec.rb", 'w') do |f|     
  f.write("""require 'rspec'
  require './#{day}'
  require 'pry'
  require 'pry-nav'

  RSpec.describe 'Day #{day}' do
    subject { Day#{day}.new(file) }
    
    describe 'Part 1' do
      context 'with the example file' do
        let(:file) { 'ex_input.txt' }

        it 'works' do
          expect(subject.part_one).to eq(nil)
        end
      end

      context 'with the main file' do
        let(:file) { 'input.txt' }
        
        it 'works' do
          expect(subject.part_one).to eq(nil)
        end
      end
    end

    describe 'Part 2' do
      context 'with the example file' do
        let(:file) { 'ex_input.txt' }

        it 'works' do
          expect(subject.part_two).to eq(nil)
        end
      end

      context 'with the main file' do
        let(:file) { 'input.txt' }
        
        it 'works' do
          expect(subject.part_two).to eq(nil)
        end
      end
    end
  end
  """)
end
system("touch #{day}/ex_input.txt")
system("touch #{day}/input.txt")

cookie = ENV['AOC_SESSION_TOKEN']
uri = URI("https://adventofcode.com/2022/day/#{day}/input")
req = Net::HTTP::Get.new(uri)
req['Cookie'] = "session=#{cookie}"
req['User-Agent'] = 'github.com/challeng'

res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') { |http|
  http.request(req)
}

File.write("#{day}/input.txt", res.body)


