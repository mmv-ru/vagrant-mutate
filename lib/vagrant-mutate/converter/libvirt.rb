module VagrantMutate
  module Converter
    class Libvirt < Converter
      def generate_metadata
        {
          'provider' => @output_box.provider_name,
          'format'   => @output_box.image_format,
          'virtual_size' => ( @input_box.virtual_size.to_f / (1024 * 1024 * 1024)).ceil
        }
      end

      def generate_vagrantfile
        <<-EOF
        config.vm.provider :libvirt do |libvirt|
          libvirt.disk_bus = '#{@input_box.disk_interface}'
        end
        EOF
      end

      def write_specific_files
        # nothing to do here
      end
    end
  end
end
