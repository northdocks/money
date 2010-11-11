# Rails reader_method uses read_attribute to get the data from a column. 
# This doesn't let us use calculated columns or delegated methods. 
# We overwrite read_attribute with send, which works with any available method. 

module ActiveRecord
  module Aggregations # :nodoc:
    module ClassMethods
      def reader_method(name, class_name, mapping, allow_nil, constructor)
        module_eval do
          define_method(name) do |*args|
            force_reload = args.first || false
            if (instance_variable_get("@#{name}").nil? || force_reload) && (!allow_nil || mapping.any? {|pair| !send(pair.first).nil? })
              attrs = mapping.collect {|pair| send(pair.first)}
              object = case constructor
                when Symbol
                  class_name.constantize.send(constructor, *attrs)
                when Proc, Method
                  constructor.call(*attrs)
                else
                  raise ArgumentError, 'Constructor must be a symbol denoting the constructor method to call or a Proc to be invoked.'
                end
              instance_variable_set("@#{name}", object)
            end
            instance_variable_get("@#{name}")
          end
        end
      end
    end
  end
end