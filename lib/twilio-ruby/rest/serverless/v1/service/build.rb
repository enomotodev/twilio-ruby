##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Serverless
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Serverless < ServerlessBase
            class V1 < Version
                class ServiceContext < InstanceContext

                     class BuildList < ListResource
                    ##
                    # Initialize the BuildList
                    # @param [Version] version Version that contains the resource
                    # @return [BuildList] BuildList
                    def initialize(version, service_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { service_sid: service_sid }
                        @uri = "/Services/#{@solution[:service_sid]}/Builds"
                        
                    end
                    ##
                    # Create the BuildInstance
                    # @param [Array[String]] asset_versions The list of Asset Version resource SIDs to include in the Build.
                    # @param [Array[String]] function_versions The list of the Function Version resource SIDs to include in the Build.
                    # @param [String] dependencies A list of objects that describe the Dependencies included in the Build. Each object contains the `name` and `version` of the dependency.
                    # @param [String] runtime The Runtime version that will be used to run the Build resource when it is deployed.
                    # @return [BuildInstance] Created BuildInstance
                    def create(
                        asset_versions: :unset, 
                        function_versions: :unset, 
                        dependencies: :unset, 
                        runtime: :unset
                    )

                        data = Twilio::Values.of({
                            'AssetVersions' => Twilio.serialize_list(asset_versions) { |e| e },
                            'FunctionVersions' => Twilio.serialize_list(function_versions) { |e| e },
                            'Dependencies' => dependencies,
                            'Runtime' => runtime,
                        })

                        payload = @version.create('POST', @uri, data: data)
                        BuildInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                        )
                    end

                
                    ##
                    # Lists BuildInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(limit: nil, page_size: nil)
                        self.stream(
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields BuildInstance records from the API.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    def each
                        limits = @version.read_limits

                        page = self.page(page_size: limits[:page_size], )

                        @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
                    end

                    ##
                    # Retrieve a single page of BuildInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of BuildInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        BuildPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of BuildInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of BuildInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    BuildPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Serverless.V1.BuildList>'
                    end
                end


                ##
                #PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
                class BuildContext < InstanceContext
                    ##
                    # Initialize the BuildContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] service_sid The SID of the Service to fetch the Build resource from.
                    # @param [String] sid The SID of the Build resource to fetch.
                    # @return [BuildContext] BuildContext
                    def initialize(version, service_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { service_sid: service_sid, sid: sid,  }
                        @uri = "/Services/#{@solution[:service_sid]}/Builds/#{@solution[:sid]}"

                        # Dependents
                        @build_status = nil
                    end
                    ##
                    # Delete the BuildInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        @version.delete('DELETE', @uri)
                    end

                    ##
                    # Fetch the BuildInstance
                    # @return [BuildInstance] Fetched BuildInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        BuildInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the build_status
                    # @return [BuildStatusList]
                    # @return [BuildStatusContext]
                    def build_status
                        BuildStatusContext.new(
                                @version,
                                @solution[:service_sid],
                                @solution[:sid]
                                )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Serverless.V1.BuildContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Serverless.V1.BuildContext #{context}>"
                    end
                end

                class BuildPage < Page
                    ##
                    # Initialize the BuildPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [BuildPage] BuildPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of BuildInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [BuildInstance] BuildInstance
                    def get_instance(payload)
                        BuildInstance.new(@version, payload, service_sid: @solution[:service_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Serverless.V1.BuildPage>'
                    end
                end
                class BuildInstance < InstanceResource
                    ##
                    # Initialize the BuildInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Build
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [BuildInstance] BuildInstance
                    def initialize(version, payload , service_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'service_sid' => payload['service_sid'],
                            'status' => payload['status'],
                            'asset_versions' => payload['asset_versions'],
                            'function_versions' => payload['function_versions'],
                            'dependencies' => payload['dependencies'],
                            'runtime' => payload['runtime'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'url' => payload['url'],
                            'links' => payload['links'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'service_sid' => service_sid  || @properties['service_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [BuildContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = BuildContext.new(@version , @params['service_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the Build resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Build resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the Service that the Build resource is associated with.
                    def service_sid
                        @properties['service_sid']
                    end
                    
                    ##
                    # @return [Status] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [Array<Hash>] The list of Asset Version resource SIDs that are included in the Build.
                    def asset_versions
                        @properties['asset_versions']
                    end
                    
                    ##
                    # @return [Array<Hash>] The list of Function Version resource SIDs that are included in the Build.
                    def function_versions
                        @properties['function_versions']
                    end
                    
                    ##
                    # @return [Array<Hash>] A list of objects that describe the Dependencies included in the Build. Each object contains the `name` and `version` of the dependency.
                    def dependencies
                        @properties['dependencies']
                    end
                    
                    ##
                    # @return [Runtime] 
                    def runtime
                        @properties['runtime']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the Build resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the Build resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the Build resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] 
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # Delete the BuildInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the BuildInstance
                    # @return [BuildInstance] Fetched BuildInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Access the build_status
                    # @return [build_status] build_status
                    def build_status
                        context.build_status
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Serverless.V1.BuildInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Serverless.V1.BuildInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end


