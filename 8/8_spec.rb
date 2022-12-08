require 'rspec'
  require './8'
  require 'pry'
  require 'pry-nav'

  RSpec.describe 'Day 8' do
    subject { Day8.new(file) }
    
    describe 'Part 1' do
      context 'with the example file' do
        let(:file) { 'ex_input.txt' }

        it 'works' do
          expect(subject.part_one).to eq(21)
        end
      end

      context 'with the main file' do
        let(:file) { 'input.txt' }
        
        it 'works' do
          expect(subject.part_one).to eq(1851)
        end
      end
    end

    describe 'Part 2' do
      context 'with the example file' do
        let(:file) { 'ex_input.txt' }

        it 'works' do
          expect(subject.part_two).to eq(8)
        end
      end

      context 'with the main file' do
        let(:file) { 'input.txt' }
        
        it 'works' do
          expect(subject.part_two).to eq(574080)
        end
      end
    end
  end
  