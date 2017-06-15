##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Notify < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          class UserContext < InstanceContext
            class UserBindingList < ListResource
              ##
              # Initialize the UserBindingList
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The service_sid
              # @param [String] identity The identity
              # @return [UserBindingList] UserBindingList
              def initialize(version, service_sid: nil, identity: nil)
                super(version)

                # Path Solution
                @solution = {
                    service_sid: service_sid,
                    identity: identity
                }
                @uri = "/Services/#{@solution[:service_sid]}/Users/#{@solution[:identity]}/Bindings"
              end

              ##
              # Retrieve a single page of UserBindingInstance records from the API.
              # Request is executed immediately.
              # @param [user_binding.BindingType] binding_type The binding_type
              # @param [String] address The address
              # @param [String] tag The tag
              # @param [String] notification_protocol_version The notification_protocol_version
              # @param [String] credential_sid The credential_sid
              # @param [String] endpoint The endpoint
              # @return [UserBindingInstance] Newly created UserBindingInstance
              def create(binding_type: nil, address: nil, tag: :unset, notification_protocol_version: :unset, credential_sid: :unset, endpoint: :unset)
                data = Twilio::Values.of({
                    'BindingType' => binding_type,
                    'Address' => address,
                    'Tag' => tag,
                    'NotificationProtocolVersion' => notification_protocol_version,
                    'CredentialSid' => credential_sid,
                    'Endpoint' => endpoint,
                })

                payload = @version.create(
                    'POST',
                    @uri,
                    data: data
                )

                UserBindingInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    identity: @solution[:identity],
                )
              end

              ##
              # Lists UserBindingInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [Date] start_date The start_date
              # @param [Date] end_date The end_date
              # @param [String] tag The tag
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #                   guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
              #  the default value of 50 records.  If no page_size is                      defined
              #  but a limit is defined, stream() will attempt to read                      the
              #  limit with the most efficient page size,                      i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(start_date: :unset, end_date: :unset, tag: :unset, limit: nil, page_size: nil)
                self.stream(
                    start_date: start_date,
                    end_date: end_date,
                    tag: tag,
                    limit: limit,
                    page_size: page_size
                ).entries
              end

              ##
              # Streams UserBindingInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [Date] start_date The start_date
              # @param [Date] end_date The end_date
              # @param [String] tag The tag
              # @param [Integer] limit Upper limit for the number of records to return.                  stream()
              #  guarantees to never return more than limit.                  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
              #  the default value of 50 records.                      If no page_size is defined
              #                       but a limit is defined, stream() will attempt to                      read the
              #  limit with the most efficient page size,                       i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(start_date: :unset, end_date: :unset, tag: :unset, limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(
                    start_date: start_date,
                    end_date: end_date,
                    tag: tag,
                    page_size: limits[:page_size],
                )

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields UserBindingInstance records from the API.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [Date] start_date The start_date
              # @param [Date] end_date The end_date
              # @param [String] tag The tag
              # @param [Integer] limit Upper limit for the number of records to return.                  stream()
              #  guarantees to never return more than limit.                  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when                       not set will use
              #  the default value of 50 records.                      If no page_size is defined
              #                       but a limit is defined, stream() will attempt to read the
              #                       limit with the most efficient page size, i.e. min(limit, 1000)
              def each
                limits = @version.read_limits

                page = self.page(
                    page_size: limits[:page_size],
                )

                @version.stream(page,
                                limit: limits[:limit],
                                page_limit: limits[:page_limit]).each {|x| yield x}
              end

              ##
              # Retrieve a single page of UserBindingInstance records from the API.
              # Request is executed immediately.
              # @param [Date] start_date The start_date
              # @param [Date] end_date The end_date
              # @param [String] tag The tag
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of UserBindingInstance
              def page(start_date: :unset, end_date: :unset, tag: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'StartDate' => Twilio.serialize_iso8601(start_date),
                    'EndDate' => Twilio.serialize_iso8601(end_date),
                    'Tag' => tag,
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })
                response = @version.page(
                    'GET',
                    @uri,
                    params
                )
                UserBindingPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of UserBindingInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of UserBindingInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                UserBindingPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Notify.V1.UserBindingList>'
              end
            end

            class UserBindingPage < Page
              ##
              # Initialize the UserBindingPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @param [String] service_sid The service_sid
              # @param [String] identity The identity
              # @return [UserBindingPage] UserBindingPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of UserBindingInstance
              # @param [Hash] payload Payload response from the API
              # @return [UserBindingInstance] UserBindingInstance
              def get_instance(payload)
                UserBindingInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    identity: @solution[:identity],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Notify.V1.UserBindingPage>'
              end
            end

            class UserBindingContext < InstanceContext
              ##
              # Initialize the UserBindingContext
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The service_sid
              # @param [String] identity The identity
              # @param [String] sid The sid
              # @return [UserBindingContext] UserBindingContext
              def initialize(version, service_sid, identity, sid)
                super(version)

                # Path Solution
                @solution = {
                    service_sid: service_sid,
                    identity: identity,
                    sid: sid,
                }
                @uri = "/Services/#{@solution[:service_sid]}/Users/#{@solution[:identity]}/Bindings/#{@solution[:sid]}"
              end

              ##
              # Fetch a UserBindingInstance
              # @return [UserBindingInstance] Fetched UserBindingInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                UserBindingInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    identity: @solution[:identity],
                    sid: @solution[:sid],
                )
              end

              ##
              # Deletes the UserBindingInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                @version.delete('delete', @uri)
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Notify.V1.UserBindingContext #{context}>"
              end
            end

            class UserBindingInstance < InstanceResource
              ##
              # Initialize the UserBindingInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] service_sid The service_sid
              # @param [String] identity The identity
              # @param [String] sid The sid
              # @return [UserBindingInstance] UserBindingInstance
              def initialize(version, payload, service_sid: nil, identity: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'sid' => payload['sid'],
                    'account_sid' => payload['account_sid'],
                    'service_sid' => payload['service_sid'],
                    'credential_sid' => payload['credential_sid'],
                    'date_created' => Twilio.deserialize_iso8601(payload['date_created']),
                    'date_updated' => Twilio.deserialize_iso8601(payload['date_updated']),
                    'notification_protocol_version' => payload['notification_protocol_version'],
                    'endpoint' => payload['endpoint'],
                    'identity' => payload['identity'],
                    'binding_type' => payload['binding_type'],
                    'address' => payload['address'],
                    'tags' => payload['tags'],
                    'url' => payload['url'],
                    'links' => payload['links'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'service_sid' => service_sid,
                    'identity' => identity,
                    'sid' => sid || @properties['sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @param [Version] version Version that contains the resource
              # @return [UserBindingContext] UserBindingContext for this UserBindingInstance
              def context
                unless @instance_context
                  @instance_context = UserBindingContext.new(
                      @version,
                      @params['service_sid'],
                      @params['identity'],
                      @params['sid'],
                  )
                end
                @instance_context
              end

              def sid
                @properties['sid']
              end

              def account_sid
                @properties['account_sid']
              end

              def service_sid
                @properties['service_sid']
              end

              def credential_sid
                @properties['credential_sid']
              end

              def date_created
                @properties['date_created']
              end

              def date_updated
                @properties['date_updated']
              end

              def notification_protocol_version
                @properties['notification_protocol_version']
              end

              def endpoint
                @properties['endpoint']
              end

              def identity
                @properties['identity']
              end

              def binding_type
                @properties['binding_type']
              end

              def address
                @properties['address']
              end

              def tags
                @properties['tags']
              end

              def url
                @properties['url']
              end

              def links
                @properties['links']
              end

              ##
              # Fetch a UserBindingInstance
              # @return [UserBindingInstance] Fetched UserBindingInstance
              def fetch
                context.fetch
              end

              ##
              # Deletes the UserBindingInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                context.delete
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Notify.V1.UserBindingInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end