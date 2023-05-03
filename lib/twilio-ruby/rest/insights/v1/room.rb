##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Insights
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Insights < InsightsBase
            class V1 < Version
                class RoomList < ListResource
                    ##
                    # Initialize the RoomList
                    # @param [Version] version Version that contains the resource
                    # @return [RoomList] RoomList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Video/Rooms"
                        
                    end
                
                    ##
                    # Lists RoomInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Array[RoomType]] room_type Type of room. Can be `go`, `peer_to_peer`, `group`, or `group_small`.
                    # @param [Array[Codec]] codec Codecs used by participants in the room. Can be `VP8`, `H264`, or `VP9`.
                    # @param [String] room_name Room friendly name.
                    # @param [Time] created_after Only read rooms that started on or after this ISO 8601 timestamp.
                    # @param [Time] created_before Only read rooms that started before this ISO 8601 timestamp.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(room_type: :unset, codec: :unset, room_name: :unset, created_after: :unset, created_before: :unset, limit: nil, page_size: nil)
                        self.stream(
                            room_type: room_type,
                            codec: codec,
                            room_name: room_name,
                            created_after: created_after,
                            created_before: created_before,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Array[RoomType]] room_type Type of room. Can be `go`, `peer_to_peer`, `group`, or `group_small`.
                    # @param [Array[Codec]] codec Codecs used by participants in the room. Can be `VP8`, `H264`, or `VP9`.
                    # @param [String] room_name Room friendly name.
                    # @param [Time] created_after Only read rooms that started on or after this ISO 8601 timestamp.
                    # @param [Time] created_before Only read rooms that started before this ISO 8601 timestamp.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(room_type: :unset, codec: :unset, room_name: :unset, created_after: :unset, created_before: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            room_type: room_type,
                            codec: codec,
                            room_name: room_name,
                            created_after: created_after,
                            created_before: created_before,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields RoomInstance records from the API.
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
                    # Retrieve a single page of RoomInstance records from the API.
                    # Request is executed immediately.
                    # @param [Array[RoomType]] room_type Type of room. Can be `go`, `peer_to_peer`, `group`, or `group_small`.
                    # @param [Array[Codec]] codec Codecs used by participants in the room. Can be `VP8`, `H264`, or `VP9`.
                    # @param [String] room_name Room friendly name.
                    # @param [Time] created_after Only read rooms that started on or after this ISO 8601 timestamp.
                    # @param [Time] created_before Only read rooms that started before this ISO 8601 timestamp.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of RoomInstance
                    def page(room_type: :unset, codec: :unset, room_name: :unset, created_after: :unset, created_before: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'RoomType' =>  Twilio.serialize_list(room_type),
                            
                            'Codec' =>  Twilio.serialize_list(codec),
                            
                            'RoomName' => room_name,
                            
                            'CreatedAfter' =>  Twilio.serialize_iso8601_datetime(created_after),
                            
                            'CreatedBefore' =>  Twilio.serialize_iso8601_datetime(created_before),
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        RoomPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of RoomInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of RoomInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    RoomPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Insights.V1.RoomList>'
                    end
                end


                ##
                #PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
                class RoomContext < InstanceContext
                    ##
                    # Initialize the RoomContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] room_sid The SID of the Room resource.
                    # @return [RoomContext] RoomContext
                    def initialize(version, room_sid)
                        super(version)

                        # Path Solution
                        @solution = { room_sid: room_sid,  }
                        @uri = "/Video/Rooms/#{@solution[:room_sid]}"

                        # Dependents
                        @participants = nil
                    end
                    ##
                    # Fetch the RoomInstance
                    # @return [RoomInstance] Fetched RoomInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        RoomInstance.new(
                            @version,
                            payload,
                            room_sid: @solution[:room_sid],
                        )
                    end

                    ##
                    # Access the participants
                    # @return [ParticipantList]
                    # @return [ParticipantContext] if sid was passed.
                    def participants(participant_sid=:unset)

                        raise ArgumentError, 'participant_sid cannot be nil' if participant_sid.nil?

                        if participant_sid != :unset
                            return ParticipantContext.new(@version, @solution[:room_sid],participant_sid )
                        end

                        unless @participants
                            @participants = ParticipantList.new(
                                @version,
                                room_room_sid: @solution[:room_sid]
                                
                                )
                        end

                     @participants
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Insights.V1.RoomContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Insights.V1.RoomContext #{context}>"
                    end
                end

                class RoomPage < Page
                    ##
                    # Initialize the RoomPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [RoomPage] RoomPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of RoomInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [RoomInstance] RoomInstance
                    def get_instance(payload)
                        RoomInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Insights.V1.RoomPage>'
                    end
                end
                class RoomInstance < InstanceResource
                    ##
                    # Initialize the RoomInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Room
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [RoomInstance] RoomInstance
                    def initialize(version, payload , room_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'room_sid' => payload['room_sid'],
                            'room_name' => payload['room_name'],
                            'create_time' => Twilio.deserialize_iso8601_datetime(payload['create_time']),
                            'end_time' => Twilio.deserialize_iso8601_datetime(payload['end_time']),
                            'room_type' => payload['room_type'],
                            'room_status' => payload['room_status'],
                            'status_callback' => payload['status_callback'],
                            'status_callback_method' => payload['status_callback_method'],
                            'created_method' => payload['created_method'],
                            'end_reason' => payload['end_reason'],
                            'max_participants' => payload['max_participants'] == nil ? payload['max_participants'] : payload['max_participants'].to_i,
                            'unique_participants' => payload['unique_participants'] == nil ? payload['unique_participants'] : payload['unique_participants'].to_i,
                            'unique_participant_identities' => payload['unique_participant_identities'] == nil ? payload['unique_participant_identities'] : payload['unique_participant_identities'].to_i,
                            'concurrent_participants' => payload['concurrent_participants'] == nil ? payload['concurrent_participants'] : payload['concurrent_participants'].to_i,
                            'max_concurrent_participants' => payload['max_concurrent_participants'] == nil ? payload['max_concurrent_participants'] : payload['max_concurrent_participants'].to_i,
                            'codecs' => payload['codecs'],
                            'media_region' => payload['media_region'],
                            'duration_sec' => payload['duration_sec'],
                            'total_participant_duration_sec' => payload['total_participant_duration_sec'],
                            'total_recording_duration_sec' => payload['total_recording_duration_sec'],
                            'processing_state' => payload['processing_state'],
                            'recording_enabled' => payload['recording_enabled'],
                            'edge_location' => payload['edge_location'],
                            'url' => payload['url'],
                            'links' => payload['links'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'room_sid' => room_sid  || @properties['room_sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [RoomContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = RoomContext.new(@version , @params['room_sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] Account SID associated with this room.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] Unique identifier for the room.
                    def room_sid
                        @properties['room_sid']
                    end
                    
                    ##
                    # @return [String] Room friendly name.
                    def room_name
                        @properties['room_name']
                    end
                    
                    ##
                    # @return [Time] Creation time of the room.
                    def create_time
                        @properties['create_time']
                    end
                    
                    ##
                    # @return [Time] End time for the room.
                    def end_time
                        @properties['end_time']
                    end
                    
                    ##
                    # @return [RoomType] 
                    def room_type
                        @properties['room_type']
                    end
                    
                    ##
                    # @return [RoomStatus] 
                    def room_status
                        @properties['room_status']
                    end
                    
                    ##
                    # @return [String] Webhook provided for status callbacks.
                    def status_callback
                        @properties['status_callback']
                    end
                    
                    ##
                    # @return [String] HTTP method provided for status callback URL.
                    def status_callback_method
                        @properties['status_callback_method']
                    end
                    
                    ##
                    # @return [CreatedMethod] 
                    def created_method
                        @properties['created_method']
                    end
                    
                    ##
                    # @return [EndReason] 
                    def end_reason
                        @properties['end_reason']
                    end
                    
                    ##
                    # @return [String] Max number of total participants allowed by the application settings.
                    def max_participants
                        @properties['max_participants']
                    end
                    
                    ##
                    # @return [String] Number of participants. May include duplicate identities for participants who left and rejoined.
                    def unique_participants
                        @properties['unique_participants']
                    end
                    
                    ##
                    # @return [String] Unique number of participant identities.
                    def unique_participant_identities
                        @properties['unique_participant_identities']
                    end
                    
                    ##
                    # @return [String] Actual number of concurrent participants.
                    def concurrent_participants
                        @properties['concurrent_participants']
                    end
                    
                    ##
                    # @return [String] Maximum number of participants allowed in the room at the same time allowed by the application settings.
                    def max_concurrent_participants
                        @properties['max_concurrent_participants']
                    end
                    
                    ##
                    # @return [Array<Codec>] Codecs used by participants in the room. Can be `VP8`, `H264`, or `VP9`.
                    def codecs
                        @properties['codecs']
                    end
                    
                    ##
                    # @return [TwilioRealm] 
                    def media_region
                        @properties['media_region']
                    end
                    
                    ##
                    # @return [String] Total room duration from create time to end time.
                    def duration_sec
                        @properties['duration_sec']
                    end
                    
                    ##
                    # @return [String] Combined amount of participant time in the room.
                    def total_participant_duration_sec
                        @properties['total_participant_duration_sec']
                    end
                    
                    ##
                    # @return [String] Combined amount of recorded seconds for participants in the room.
                    def total_recording_duration_sec
                        @properties['total_recording_duration_sec']
                    end
                    
                    ##
                    # @return [ProcessingState] 
                    def processing_state
                        @properties['processing_state']
                    end
                    
                    ##
                    # @return [Boolean] Boolean indicating if recording is enabled for the room.
                    def recording_enabled
                        @properties['recording_enabled']
                    end
                    
                    ##
                    # @return [EdgeLocation] 
                    def edge_location
                        @properties['edge_location']
                    end
                    
                    ##
                    # @return [String] URL for the room resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] Room subresources.
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # Fetch the RoomInstance
                    # @return [RoomInstance] Fetched RoomInstance
                    def fetch

                        context.fetch
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
                        "<Twilio.Insights.V1.RoomInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Insights.V1.RoomInstance #{values}>"
                    end
                end

            end
        end
    end
end
