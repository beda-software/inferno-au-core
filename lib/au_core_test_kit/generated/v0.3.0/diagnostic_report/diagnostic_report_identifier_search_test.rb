require_relative '../../../search_test'
require_relative '../../../generator/group_metadata'

module AUCoreTestKit
  module AUCoreV030
    class DiagnosticReportIdentifierSearchTest < Inferno::Test
      include AUCoreTestKit::SearchTest

      title 'Server returns valid results for DiagnosticReport search by identifier'
      description %(
A server SHALL support searching by
identifier on the DiagnosticReport resource. This test
will pass if resources are returned and match the search criteria. If
none are returned, the test is skipped.

[AU Core Server CapabilityStatement](http://hl7.org/fhir/us/core//CapabilityStatement-us-core-server.html)

      )

      id :au_core_v030_diagnostic_report_identifier_search_test
      def self.properties
        @properties ||= SearchTestProperties.new(
          resource_type: 'DiagnosticReport',
        search_param_names: ['identifier'],
        possible_status_search: true,
        token_search_params: ['identifier']
        )
      end

      def self.metadata
        @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml'), aliases: true))
      end

      def scratch_resources
        scratch[:diagnostic_report_resources] ||= {}
      end

      run do
        run_search_test
      end
    end
  end
end
