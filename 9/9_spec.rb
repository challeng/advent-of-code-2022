require 'rspec'
  require './9'
  require 'pry'
  require 'pry-nav'

  RSpec.describe 'Day 9' do
    subject { Day9.new(file) }
    
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
          expect(subject.part_one).to eq(6642)
        end
      end
    end

    describe 'Part 2' do
      context 'with the example file' do
        let(:file) { 'ex_input_2.txt' }

        it 'works' do
          expect(subject.part_two).to eq(36)
        end
      end

      context 'with the main file' do
        let(:file) { 'input.txt' }
        
        it 'works' do
          expect(subject.part_two).to eq(2765)
        end
      end
    end
  end
  