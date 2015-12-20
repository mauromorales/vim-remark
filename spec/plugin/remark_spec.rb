require "spec_helper"

describe "Remark" do
  include GivenFilesystemSpecHelpers
  use_given_filesystem

  around(:each) do |example|
    Dir.chdir(path) do
      example.run
    end
  end

  let(:path) { given_directory_from_test_data "example" }

  describe ":RemarkBuild" do
    let(:expected_path) { given_directory_from_test_data "expected" }

    it "converts markdown to a remark html slide" do
      vim.edit "example.md"

      output = vim.command "RemarkBuild"

      expect(output).to eq("")
      expect(File.exist?("example.html")).to be_truthy
      expect(File.read("example.html")).
        to eq(File.read(File.join(expected_path, "example.html")))
    end

    context "when a layout file exists" do
      let(:path) { given_directory_from_test_data "example_with_layout" }

      it "uses the given layout" do
        vim.edit "example.md"

        output = vim.command "RemarkBuild"

        expect(output).to eq("")
        expect(File.exist?("example.html")).to be_truthy
        expect(File.read("example.html")).
          to eq(File.read(File.join(expected_path, "example_with_layout.html")))
      end
    end
  end

  describe ":RemarkPreview" do
    it "opens a browser window with the html file" do
      vim.edit "example.md"

      output = vim.command "RemarkPreview"

      expect(output).to eq("")
    end
  end
end
