require_relative '../../../search_test'
require_relative '../../../generator/group_metadata'

module USCoreTestKit
  module USCoreV030
    class MedicationRequestIdSearchTest < Inferno::Test
      include USCoreTestKit::SearchTest

      title 'Server returns valid results for MedicationRequest search by _id'
      description %(
A server SHALL support searching by
_id on the MedicationRequest resource. This test
will pass if resources are returned and match the search criteria. If
none are returned, the test is skipped.

If any MedicationRequest resources use external references to
Medications, the search will be repeated with
`_include=MedicationRequest:medication`.

[US Core Server CapabilityStatement](http://hl7.org/fhir/us/core//CapabilityStatement-us-core-server.html)

      )

      id :us_core_v030_medication_request__id_search_test
      def self.properties
        @properties ||= SearchTestProperties.new(
          resource_type: 'MedicationRequest',
        search_param_names: ['_id'],
        possible_status_search: true,
        test_medication_inclusion: true
        )
      end

      def self.metadata
        @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml'), aliases: true))
      end

      def scratch_resources
        scratch[:medication_request_resources] ||= {}
      end

      run do
        run_search_test
      end
    end
  end
end