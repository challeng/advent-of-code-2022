require 'rspec'
  require './13'
  require 'pry'
  require 'pry-nav'

  RSpec.describe 'Day 13' do
    subject { Day13.new(file) }
    
    describe 'Part 1' do
      context 'with the example file' do
        let(:file) { 'ex_input.txt' }

        it 'works' do
          expect(subject.part_one).to eq(13)
        end
      end

      context 'with the main file' do
        let(:file) { 'input.txt' }
        
        it 'works' do
          expect(subject.part_one).to eq(5843)
        end
      end
    end

    describe 'Part 2' do
      context 'with the example file' do
        let(:file) { 'ex_input.txt' }

        it 'works' do
          expect(subject.part_two).to eq(140)
        end
      end

      context 'with the main file' do
        let(:file) { 'input.txt' }
        
        it 'works' do
          expect(subject.part_two).to eq(26289)
        end
      end
    end
  end
  