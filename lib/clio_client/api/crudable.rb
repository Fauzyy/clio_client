module ClioClient
  module Api
    module Crudable

      def new(params = {})
        data_item(params)
      end

      def create(params = {})
        response = session.post(end_point_url, {singular_resource => params}.to_json)
        data_item(response[singular_resource])        
      end

      def update(id, params = {})
        response = session.put("#{end_point_url}/#{id}", {singular_resource => params}.to_json)
        data_item(response[singular_resource])        
      end

      def destroy(id)
        session.delete("#{end_point_url}/#{id}", false)
      end

    end
  end
end
