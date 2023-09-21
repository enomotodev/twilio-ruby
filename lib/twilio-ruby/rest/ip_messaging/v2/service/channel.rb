##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Ip_messaging
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class IpMessaging < IpMessagingBase
            class V2 < Version
                class ServiceContext < InstanceContext

                     class ChannelList < ListResource
                    ##
                    # Initialize the ChannelList
                    # @param [Version] version Version that contains the resource
                    # @return [ChannelList] ChannelList
                    def initialize(version, service_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { service_sid: service_sid }
                        @uri = "/Services/#{@solution[:service_sid]}/Channels"
                        
                    end
                    ##
                    # Create the ChannelInstance
                    # @param [String] friendly_name 
                    # @param [String] unique_name 
                    # @param [String] attributes 
                    # @param [ChannelType] type 
                    # @param [Time] date_created 
                    # @param [Time] date_updated 
                    # @param [String] created_by 
                    # @param [ChannelEnumWebhookEnabledType] x_twilio_webhook_enabled The X-Twilio-Webhook-Enabled HTTP request header
                    # @return [ChannelInstance] Created ChannelInstance
                    def create(
                        friendly_name: :unset, 
                        unique_name: :unset, 
                        attributes: :unset, 
                        type: :unset, 
                        date_created: :unset, 
                        date_updated: :unset, 
                        created_by: :unset, 
                        x_twilio_webhook_enabled: :unset
                    )

                        data = Twilio::Values.of({
                            'FriendlyName' => friendly_name,
                            'UniqueName' => unique_name,
                            'Attributes' => attributes,
                            'Type' => type,
                            'DateCreated' => Twilio.serialize_iso8601_datetime(date_created),
                            'DateUpdated' => Twilio.serialize_iso8601_datetime(date_updated),
                            'CreatedBy' => created_by,
                        })

                        headers = Twilio::Values.of({ 'X-Twilio-Webhook-Enabled' => x_twilio_webhook_enabled, })
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        ChannelInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                        )
                    end

                
                    ##
                    # Lists ChannelInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Array[ChannelType]] type 
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(type: :unset, limit: nil, page_size: nil)
                        self.stream(
                            type: type,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Array[ChannelType]] type 
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(type: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            type: type,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields ChannelInstance records from the API.
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
                    # Retrieve a single page of ChannelInstance records from the API.
                    # Request is executed immediately.
                    # @param [Array[ChannelType]] type 
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of ChannelInstance
                    def page(type: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'Type' =>  Twilio.serialize_list(type) { |e| e },
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        ChannelPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of ChannelInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of ChannelInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    ChannelPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.IpMessaging.V2.ChannelList>'
                    end
                end


                class ChannelContext < InstanceContext
                    ##
                    # Initialize the ChannelContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] service_sid 
                    # @param [String] sid 
                    # @return [ChannelContext] ChannelContext
                    def initialize(version, service_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { service_sid: service_sid, sid: sid,  }
                        @uri = "/Services/#{@solution[:service_sid]}/Channels/#{@solution[:sid]}"

                        # Dependents
                        @webhooks = nil
                        @members = nil
                        @messages = nil
                        @invites = nil
                    end
                    ##
                    # Delete the ChannelInstance
                    # @param [ChannelEnumWebhookEnabledType] x_twilio_webhook_enabled The X-Twilio-Webhook-Enabled HTTP request header
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete(
                        x_twilio_webhook_enabled: :unset
                    )

                        headers = Twilio::Values.of({ 'X-Twilio-Webhook-Enabled' => x_twilio_webhook_enabled, })
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the ChannelInstance
                    # @return [ChannelInstance] Fetched ChannelInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        ChannelInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the ChannelInstance
                    # @param [String] friendly_name 
                    # @param [String] unique_name 
                    # @param [String] attributes 
                    # @param [Time] date_created 
                    # @param [Time] date_updated 
                    # @param [String] created_by 
                    # @param [ChannelEnumWebhookEnabledType] x_twilio_webhook_enabled The X-Twilio-Webhook-Enabled HTTP request header
                    # @return [ChannelInstance] Updated ChannelInstance
                    def update(
                        friendly_name: :unset, 
                        unique_name: :unset, 
                        attributes: :unset, 
                        date_created: :unset, 
                        date_updated: :unset, 
                        created_by: :unset, 
                        x_twilio_webhook_enabled: :unset
                    )

                        data = Twilio::Values.of({
                            'FriendlyName' => friendly_name,
                            'UniqueName' => unique_name,
                            'Attributes' => attributes,
                            'DateCreated' => Twilio.serialize_iso8601_datetime(date_created),
                            'DateUpdated' => Twilio.serialize_iso8601_datetime(date_updated),
                            'CreatedBy' => created_by,
                        })

                        headers = Twilio::Values.of({ 'X-Twilio-Webhook-Enabled' => x_twilio_webhook_enabled, })
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        ChannelInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the webhooks
                    # @return [WebhookList]
                    # @return [WebhookContext] if sid was passed.
                    def webhooks(sid=:unset)

                        raise ArgumentError, 'sid cannot be nil' if sid.nil?

                        if sid != :unset
                            return WebhookContext.new(@version, @solution[:service_sid], @solution[:sid],sid )
                        end

                        unless @webhooks
                            @webhooks = WebhookList.new(
                                @version, service_sid: @solution[:service_sid], channel_sid: @solution[:sid], )
                        end

                     @webhooks
                    end
                    ##
                    # Access the members
                    # @return [MemberList]
                    # @return [MemberContext] if sid was passed.
                    def members(sid=:unset)

                        raise ArgumentError, 'sid cannot be nil' if sid.nil?

                        if sid != :unset
                            return MemberContext.new(@version, @solution[:service_sid], @solution[:sid],sid )
                        end

                        unless @members
                            @members = MemberList.new(
                                @version, service_sid: @solution[:service_sid], channel_sid: @solution[:sid], )
                        end

                     @members
                    end
                    ##
                    # Access the messages
                    # @return [MessageList]
                    # @return [MessageContext] if sid was passed.
                    def messages(sid=:unset)

                        raise ArgumentError, 'sid cannot be nil' if sid.nil?

                        if sid != :unset
                            return MessageContext.new(@version, @solution[:service_sid], @solution[:sid],sid )
                        end

                        unless @messages
                            @messages = MessageList.new(
                                @version, service_sid: @solution[:service_sid], channel_sid: @solution[:sid], )
                        end

                     @messages
                    end
                    ##
                    # Access the invites
                    # @return [InviteList]
                    # @return [InviteContext] if sid was passed.
                    def invites(sid=:unset)

                        raise ArgumentError, 'sid cannot be nil' if sid.nil?

                        if sid != :unset
                            return InviteContext.new(@version, @solution[:service_sid], @solution[:sid],sid )
                        end

                        unless @invites
                            @invites = InviteList.new(
                                @version, service_sid: @solution[:service_sid], channel_sid: @solution[:sid], )
                        end

                     @invites
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.IpMessaging.V2.ChannelContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.IpMessaging.V2.ChannelContext #{context}>"
                    end
                end

                class ChannelPage < Page
                    ##
                    # Initialize the ChannelPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [ChannelPage] ChannelPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of ChannelInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [ChannelInstance] ChannelInstance
                    def get_instance(payload)
                        ChannelInstance.new(@version, payload, service_sid: @solution[:service_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.IpMessaging.V2.ChannelPage>'
                    end
                end
                class ChannelInstance < InstanceResource
                    ##
                    # Initialize the ChannelInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Channel
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [ChannelInstance] ChannelInstance
                    def initialize(version, payload , service_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'service_sid' => payload['service_sid'],
                            'friendly_name' => payload['friendly_name'],
                            'unique_name' => payload['unique_name'],
                            'attributes' => payload['attributes'],
                            'type' => payload['type'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'created_by' => payload['created_by'],
                            'members_count' => payload['members_count'] == nil ? payload['members_count'] : payload['members_count'].to_i,
                            'messages_count' => payload['messages_count'] == nil ? payload['messages_count'] : payload['messages_count'].to_i,
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
                    # @return [ChannelContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = ChannelContext.new(@version , @params['service_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] 
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] 
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] 
                    def service_sid
                        @properties['service_sid']
                    end
                    
                    ##
                    # @return [String] 
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [String] 
                    def unique_name
                        @properties['unique_name']
                    end
                    
                    ##
                    # @return [String] 
                    def attributes
                        @properties['attributes']
                    end
                    
                    ##
                    # @return [ChannelType] 
                    def type
                        @properties['type']
                    end
                    
                    ##
                    # @return [Time] 
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] 
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] 
                    def created_by
                        @properties['created_by']
                    end
                    
                    ##
                    # @return [String] 
                    def members_count
                        @properties['members_count']
                    end
                    
                    ##
                    # @return [String] 
                    def messages_count
                        @properties['messages_count']
                    end
                    
                    ##
                    # @return [String] 
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] 
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # Delete the ChannelInstance
                    # @param [ChannelEnumWebhookEnabledType] x_twilio_webhook_enabled The X-Twilio-Webhook-Enabled HTTP request header
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete(
                        x_twilio_webhook_enabled: :unset
                    )

                        context.delete(
                            x_twilio_webhook_enabled: x_twilio_webhook_enabled, 
                        )
                    end

                    ##
                    # Fetch the ChannelInstance
                    # @return [ChannelInstance] Fetched ChannelInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the ChannelInstance
                    # @param [String] friendly_name 
                    # @param [String] unique_name 
                    # @param [String] attributes 
                    # @param [Time] date_created 
                    # @param [Time] date_updated 
                    # @param [String] created_by 
                    # @param [ChannelEnumWebhookEnabledType] x_twilio_webhook_enabled The X-Twilio-Webhook-Enabled HTTP request header
                    # @return [ChannelInstance] Updated ChannelInstance
                    def update(
                        friendly_name: :unset, 
                        unique_name: :unset, 
                        attributes: :unset, 
                        date_created: :unset, 
                        date_updated: :unset, 
                        created_by: :unset, 
                        x_twilio_webhook_enabled: :unset
                    )

                        context.update(
                            friendly_name: friendly_name, 
                            unique_name: unique_name, 
                            attributes: attributes, 
                            date_created: date_created, 
                            date_updated: date_updated, 
                            created_by: created_by, 
                            x_twilio_webhook_enabled: x_twilio_webhook_enabled, 
                        )
                    end

                    ##
                    # Access the webhooks
                    # @return [webhooks] webhooks
                    def webhooks
                        context.webhooks
                    end

                    ##
                    # Access the members
                    # @return [members] members
                    def members
                        context.members
                    end

                    ##
                    # Access the messages
                    # @return [messages] messages
                    def messages
                        context.messages
                    end

                    ##
                    # Access the invites
                    # @return [invites] invites
                    def invites
                        context.invites
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.IpMessaging.V2.ChannelInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.IpMessaging.V2.ChannelInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end


