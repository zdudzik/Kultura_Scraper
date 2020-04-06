# File created 02/18/2020 by Clayton Mong
# Code to test file input and output
# Given an input file, ensure the output matches a given expected output

# Imports
require 'test/unit'
require 'identikal'


class Testing < Test::Unit::TestCase
    # Created 02/18/2020 by Clayton Mong
    # tests to see if file input produces the same result as user input 
    def test_input1
     base_path = File.expand_path(File.join(__dir__))
     system("ruby", "../main.rb", "test1.txt")
     pdf_output = File.join base_path, 'courses.pdf'
     pdf_expected = File.join base_path, 'test1_answer.pdf'
     assert_equal Identikal.files_same?(pdf_output, pdf_expected), true, "The files should be the same"
    end

    # Created 02/18/2020 by Clayton Mong
    # tests to see if file input produces the same result as user input 
    def test_input2
        base_path = File.expand_path(File.join(__dir__))
        system("ruby", "../main.rb", "test2.txt")
        pdf_output = File.join base_path, 'courses.pdf'
        pdf_expected = File.join base_path, 'test2_answer.pdf'
        assert_equal Identikal.files_same?(pdf_output, pdf_expected), true, "The files should be the same"
    end

    # Created 02/18/2020 by Clayton Mong
    # tests to see if file input produces the same result as user input 
    def test_input3
        base_path = File.expand_path(File.join(__dir__))
        system("ruby", "../main.rb", "test3.txt")
        pdf_output = File.join base_path, 'courses.pdf'
        pdf_expected = File.join base_path, 'test3_answer.pdf'
        assert_equal Identikal.files_same?(pdf_output, pdf_expected), true, "The files should be the same"
    end

    # Created 02/18/2020 by Clayton Mong
    # tests to see if file input produces the same result as user input 
    def test_input4
        base_path = File.expand_path(File.join(__dir__))
        system("ruby", "../main.rb", "test4.txt")
        pdf_output = File.join base_path, 'courses.pdf'
        pdf_expected = File.join base_path, 'test4_answer.pdf'
        assert_equal Identikal.files_same?(pdf_output, pdf_expected), true, "The files should be the same"
    end

    # Created 02/18/2020 by Clayton Mong
    # tests to see if file input produces the same result as user input 
    def test_input5
        base_path = File.expand_path(File.join(__dir__))
        system("ruby", "../main.rb", "test5.txt")
        pdf_output = File.join base_path, 'courses.pdf'
        pdf_expected = File.join base_path, 'test5_answer.pdf'
        assert_equal Identikal.files_same?(pdf_output, pdf_expected), true, "The files should be the same"
    end

    # Created 02/18/2020 by Clayton Mong
    # tests to see if file input produces the same result as user input 
    def test_input6
        base_path = File.expand_path(File.join(__dir__))
        system("ruby", "../main.rb", "test6.txt")
        pdf_output = File.join base_path, 'courses.pdf'
        pdf_expected = File.join base_path, 'test6_answer.pdf'
        assert_equal Identikal.files_same?(pdf_output, pdf_expected), true, "The files should be the same"
    end
end
