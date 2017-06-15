##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Preview < Domain
      class Proxy < Version
        class ServiceContext < InstanceContext
          class SessionList < ListResource
            ##
            # Initialize the SessionList
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The unique SID identifier of the Service.
            # @return [SessionList] SessionList
            def initialize(version, service_sid: nil)
              super(version)

              # Path Solution
              @solution = {
                  service_sid: service_sid
              }
              @uri = "/Services/#{@solution[:service_sid]}/Sessions"
            end

            ##
            # Lists SessionInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [String] unique_name Provides a unique and addressable name to be
            #   assigned to this Session, assigned by the developer, to be optionally used in
            #   addition to SID.
            # @param [session.Status] status The Status of this Session. One of `in-progess`
            #   or `completed`.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #                   guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
            #  the default value of 50 records.  If no page_size is                      defined
            #  but a limit is defined, stream() will attempt to read                      the
            #  limit with the most efficient page size,                      i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(unique_name: :unset, status: :unset, limit: nil, page_size: nil)
              self.stream(
                  unique_name: unique_name,
                  status: status,
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams SessionInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [String] unique_name Provides a unique and addressable name to be
            #   assigned to this Session, assigned by the developer, to be optionally used in
            #   addition to SID.
            # @param [session.Status] status The Status of this Session. One of `in-progess`
            #   or `completed`.
            # @param [Integer] limit Upper limit for the number of records to return.                  stream()
            #  guarantees to never return more than limit.                  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
            #  the default value of 50 records.                      If no page_size is defined
            #                       but a limit is defined, stream() will attempt to                      read the
            #  limit with the most efficient page size,                       i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(unique_name: :unset, status: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  unique_name: unique_name,
                  status: status,
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields SessionInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [String] unique_name Provides a unique and addressable name to be
            #   assigned to this Session, assigned by the developer, to be optionally used in
            #   addition to SID.
            # @param [session.Status] status The Status of this Session. One of `in-progess`
            #   or `completed`.
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
            # Retrieve a single page of SessionInstance records from the API.
            # Request is executed immediately.
            # @param [String] unique_name Provides a unique and addressable name to be
            #   assigned to this Session, assigned by the developer, to be optionally used in
            #   addition to SID.
            # @param [session.Status] status The Status of this Session. One of `in-progess`
            #   or `completed`.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of SessionInstance
            def page(unique_name: :unset, status: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'UniqueName' => unique_name,
                  'Status' => status,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              SessionPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of SessionInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of SessionInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              SessionPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of SessionInstance records from the API.
            # Request is executed immediately.
            # @param [String] unique_name Provides a unique and addressable name to be
            #   assigned to this Session, assigned by the developer, to be optionally used in
            #   addition to SID.
            # @param [String] ttl How long will this session stay open, in seconds. Each new
            #   interaction resets this timer.
            # @param [session.Status] status The Status of this Session. One of `in-progess`
            #   or `completed`.
            # @param [String] participants The participants
            # @return [SessionInstance] Newly created SessionInstance
            def create(unique_name: :unset, ttl: :unset, status: :unset, participants: :unset)
              data = Twilio::Values.of({
                  'UniqueName' => unique_name,
                  'Ttl' => ttl,
                  'Status' => status,
                  'Participants' => participants,
              })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              SessionInstance.new(
                  @version,
                  payload,
                  service_sid: @solution[:service_sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Preview.Proxy.SessionList>'
            end
          end

          class SessionPage < Page
            ##
            # Initialize the SessionPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @param [String] service_sid The unique SID identifier of the Service.
            # @return [SessionPage] SessionPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of SessionInstance
            # @param [Hash] payload Payload response from the API
            # @return [SessionInstance] SessionInstance
            def get_instance(payload)
              SessionInstance.new(
                  @version,
                  payload,
                  service_sid: @solution[:service_sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Preview.Proxy.SessionPage>'
            end
          end

          class SessionContext < InstanceContext
            ##
            # Initialize the SessionContext
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The unique SID identifier of the Service.
            # @param [String] sid A 34 character string that uniquely identifies this Session.
            # @return [SessionContext] SessionContext
            def initialize(version, service_sid, sid)
              super(version)

              # Path Solution
              @solution = {
                  service_sid: service_sid,
                  sid: sid,
              }
              @uri = "/Services/#{@solution[:service_sid]}/Sessions/#{@solution[:sid]}"

              # Dependents
              @interactions = nil
              @participants = nil
            end

            ##
            # Fetch a SessionInstance
            # @return [SessionInstance] Fetched SessionInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              SessionInstance.new(
                  @version,
                  payload,
                  service_sid: @solution[:service_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Deletes the SessionInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Update the SessionInstance
            # @param [String] unique_name Provides a unique and addressable name to be
            #   assigned to this Session, assigned by the developer, to be optionally used in
            #   addition to SID.
            # @param [String] ttl How long will this session stay open, in seconds. Each new
            #   interaction resets this timer.
            # @param [session.Status] status The Status of this Session. One of `in-progess`
            #   or `completed`.
            # @param [String] participants The participants
            # @return [SessionInstance] Updated SessionInstance
            def update(unique_name: :unset, ttl: :unset, status: :unset, participants: :unset)
              data = Twilio::Values.of({
                  'UniqueName' => unique_name,
                  'Ttl' => ttl,
                  'Status' => status,
                  'Participants' => participants,
              })

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              SessionInstance.new(
                  @version,
                  payload,
                  service_sid: @solution[:service_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Access the interactions
            # @return [InteractionList] InteractionList
            def interactions(sid=:unset)
              if sid != :unset
                return InteractionContext.new(
                    @version,
                    @solution[:service_sid],
                    @solution[:sid],
                    sid,
                )
              end

              unless @interactions
                @interactions = InteractionList.new(
                    @version,
                    service_sid: @solution[:service_sid],
                    session_sid: @solution[:sid],
                )
              end

              @interactions
            end

            ##
            # Access the participants
            # @return [ParticipantList] ParticipantList
            def participants(sid=:unset)
              if sid != :unset
                return ParticipantContext.new(
                    @version,
                    @solution[:service_sid],
                    @solution[:sid],
                    sid,
                )
              end

              unless @participants
                @participants = ParticipantList.new(
                    @version,
                    service_sid: @solution[:service_sid],
                    session_sid: @solution[:sid],
                )
              end

              @participants
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Preview.Proxy.SessionContext #{context}>"
            end
          end

          class SessionInstance < InstanceResource
            ##
            # Initialize the SessionInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] service_sid The unique SID identifier of the Service.
            # @param [String] sid A 34 character string that uniquely identifies this Session.
            # @return [SessionInstance] SessionInstance
            def initialize(version, payload, service_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'service_sid' => payload['service_sid'],
                  'account_sid' => payload['account_sid'],
                  'unique_name' => payload['unique_name'],
                  'ttl' => payload['ttl'].to_i,
                  'status' => payload['status'],
                  'start_time' => Twilio.deserialize_iso8601(payload['start_time']),
                  'end_time' => Twilio.deserialize_iso8601(payload['end_time']),
                  'date_created' => Twilio.deserialize_iso8601(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601(payload['date_updated']),
                  'url' => payload['url'],
                  'links' => payload['links'],
              }

              # Context
              @instance_context = nil
              @params = {
                  'service_sid' => service_sid,
                  'sid' => sid || @properties['sid'],
              }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @param [Version] version Version that contains the resource
            # @return [SessionContext] SessionContext for this SessionInstance
            def context
              unless @instance_context
                @instance_context = SessionContext.new(
                    @version,
                    @params['service_sid'],
                    @params['sid'],
                )
              end
              @instance_context
            end

            def sid
              @properties['sid']
            end

            def service_sid
              @properties['service_sid']
            end

            def account_sid
              @properties['account_sid']
            end

            def unique_name
              @properties['unique_name']
            end

            def ttl
              @properties['ttl']
            end

            def status
              @properties['status']
            end

            def start_time
              @properties['start_time']
            end

            def end_time
              @properties['end_time']
            end

            def date_created
              @properties['date_created']
            end

            def date_updated
              @properties['date_updated']
            end

            def url
              @properties['url']
            end

            def links
              @properties['links']
            end

            ##
            # Fetch a SessionInstance
            # @return [SessionInstance] Fetched SessionInstance
            def fetch
              context.fetch
            end

            ##
            # Deletes the SessionInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end

            ##
            # Update the SessionInstance
            # @param [String] unique_name Provides a unique and addressable name to be
            #   assigned to this Session, assigned by the developer, to be optionally used in
            #   addition to SID.
            # @param [String] ttl How long will this session stay open, in seconds. Each new
            #   interaction resets this timer.
            # @param [session.Status] status The Status of this Session. One of `in-progess`
            #   or `completed`.
            # @param [String] participants The participants
            # @return [SessionInstance] Updated SessionInstance
            def update(unique_name: :unset, ttl: :unset, status: :unset, participants: :unset)
              context.update(
                  unique_name: unique_name,
                  ttl: ttl,
                  status: status,
                  participants: participants,
              )
            end

            ##
            # Access the interactions
            # @return [interactions] interactions
            def interactions
              context.interactions
            end

            ##
            # Access the participants
            # @return [participants] participants
            def participants
              context.participants
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Preview.Proxy.SessionInstance #{values}>"
            end
          end
        end
      end
    end
  end
end