require_relative '../../../read_test'

module AUCoreTestKit
  module AUCoreV030
    class HealthcareServiceReadTest < Inferno::Test
      include AUCoreTestKit::ReadTest

      title 'Server returns correct HealthcareService resource from HealthcareService read interaction'
      description 'A server SHALL support the HealthcareService read interaction.'

      id :au_core_v030_healthcare_service_read_test

      def resource_type
        'HealthcareService'
      end

      def scratch_resources
        scratch[:healthcare_service_resources] ||= {}
      end

      run do
        perform_read_test(scratch.dig(:references, 'HealthcareService'))
      end
    end
  end
end
