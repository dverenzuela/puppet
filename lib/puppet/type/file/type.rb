module Puppet
  Puppet::Type.type(:file).newproperty(:type) do
    require 'etc'
    desc "A read-only state to check the file type."

    def retrieve
      current_value = :absent
      if stat = @resource.stat(false)
        current_value = stat.ftype
      end
      current_value
    end

    validate do
      fail "type is read-only"
    end
  end
end

